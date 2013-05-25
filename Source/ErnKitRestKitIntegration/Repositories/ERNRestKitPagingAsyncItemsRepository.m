#import "ERNRestKitPagingAsyncItemsRepository.h"
#import "ERNItemsToAsyncItemRepository.h"
#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"
#import "NSObject+ERNHelper.h"
#import "ERNRepositoryPaginator.h"
#import "ERNNullRepositoryPaginator.h"
#import "ERNItemsToAsyncPaginatedItemsRepository.h"
#import <RestKit/RestKit.h>

@interface ERNRestKitPagingAsyncItemsRepository ()
@property (nonatomic) id<ERNAsyncItemRepository> repository;
@property (nonatomic) id<ERNRepositoryPaginator> paginator;
@property (nonatomic, readonly) RKResponseDescriptor *responseDescriptor;
@property (nonatomic, readonly) NSURL *url;
@end

@implementation ERNRestKitPagingAsyncItemsRepository {
    NSURL *_url;
    id<ERNRepositoryPaginator> _paginator;
}

#pragma mark - public - constructors

+(instancetype)createWithUrl:(NSURL *)url
responseDescriptor:(RKResponseDescriptor *)responseDescriptor
{
    return [[self alloc] initWithUrl:url
                  responseDescriptor:responseDescriptor];
}

#pragma mark - ERNAsyncItemsRepository

-(void)refresh
{
    [[self repository] removeObserver:self];
    [self setRepository:[ERNItemsToAsyncItemRepository
                         createWithRepository:[ERNItemsToAsyncPaginatedItemsRepository createWithRepository:
                                               [ERNRestKitAsyncItemsRepository
                                                createWithUrl:[self url]
                                                responseDescriptor:[self responseDescriptor]]]]];
    [[self repository] addObserver:self
                          selector:@selector(repositoryRefreshed)];
}

-(NSUInteger)count
{
    return [[self array] count];
}


#pragma mark - ERNAsyncPaginatedItemsRepository

-(id<NSObject>)itemAtTotalIndex:(NSUInteger)index
{
    return [self indexWithinArray:index] ?
    [self array][index] :
    [self updatePageAndReturnNullObject];
}

-(NSUInteger)total
{
    return [[self paginator] total];
}

-(NSUInteger)offset
{
    return 0;
}

#pragma mark - NSObject

-(void)dealloc
{
    [_repository removeObserver:self];
}

#pragma mark - private

-(id<NSObject>)updatePageAndReturnNullObject
{
    [[self repository] removeObserver:self];
    [self setRepository:[ERNItemsToAsyncItemRepository
                         createWithRepository:[ERNItemsToAsyncPaginatedItemsRepository createWithRepository:
                         [ERNRestKitAsyncItemsRepository
                          createWithUrl:[[self paginator] nextPage]
                          responseDescriptor:[self responseDescriptor]]]]];
    [[self repository] addObserver:self
                          selector:@selector(repositoryRefreshed)];
    return [NSNull null];
}

-(BOOL)indexWithinArray:(NSUInteger)index
{
    return index < [[self array] count];
}

-(void)repositoryRefreshed
{
    [self setPaginator:[self validatePaginator:[[self repository] item]]];
    [self setArray:[[self array] arrayByAddingObjectsFromArray:[[self paginator] items]]];
    [self notifyObservers];
}

-(id<ERNRepositoryPaginator>)validatePaginator:(id)paginator
{
    return paginator && [paginator conformsToProtocol:@protocol(ERNRepositoryPaginator)] ?
    paginator :
    [ERNNullRepositoryPaginator create];
}

#pragma mark - private - accessors

-(NSURL *)url
{
    return _url = _url ? _url : [NSURL ERN_createNull];
}

-(id<ERNRepositoryPaginator>)paginator
{
    return _paginator = _paginator ? _paginator : [ERNNullRepositoryPaginator create];
}

#pragma mark - private - initializers

-(id)initWithUrl:(NSURL *)url
responseDescriptor:(RKResponseDescriptor *)responseDescriptor
{
    self = [super init];
    ERNCheckNil(self);
    _url = url;
    _responseDescriptor = responseDescriptor;
    return self;
}

@end
