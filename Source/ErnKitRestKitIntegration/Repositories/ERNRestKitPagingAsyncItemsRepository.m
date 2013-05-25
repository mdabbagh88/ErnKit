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
    [[self repository] refresh];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [super itemAtIndex:index];
}

#pragma mark - ERNAsyncPaginatedItemsRepository

-(NSUInteger)total
{
    return [[[self paginator] nextPage] hasValue] ?
    [[[self paginator] total] unsignedIntegerValue] :
    [self count] + [self offset];
}

-(NSUInteger)offset
{
    return 0;
}

-(void)fetchPrevious
{
}

-(BOOL)hasPrevious
{
    return NO;
}

-(BOOL)hasNext
{
    return [[[self paginator] nextPage] hasValue];
}

-(void)fetchNext
{
    [[self repository] removeObserver:self];
    [self setRepository:[ERNItemsToAsyncItemRepository
                         createWithRepository:
                         [ERNItemsToAsyncPaginatedItemsRepository createWithRepository:
                         [ERNRestKitAsyncItemsRepository
                          createWithUrl:[[self paginator] nextPage]
                          responseDescriptor:[self responseDescriptor]]]]];
    [[self repository] addObserver:self
                          selector:@selector(repositoryPageRefreshed)];
    [[self repository] refresh];
}

#pragma mark - NSObject

-(void)dealloc
{
    [_repository removeObserver:self];
}

#pragma mark - private

-(BOOL)indexWithinArray:(NSUInteger)index
{
    return index < [[self array] count];
}

-(void)repositoryRefreshed
{
    [self setPaginator:[self validatePaginator:[[self repository] item]]];
    [self setArray:[[self paginator] items]];
}

-(void)repositoryPageRefreshed
{
    [self setPaginator:[self validatePaginator:[[self repository] item]]];
    [self setArray:
     [[self array] arrayByAddingObjectsFromArray:[[self paginator] items]]];
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
