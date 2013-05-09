#import "ERNRestKitPagingAsyncItemsRepository.h"
#import "ERNItemsToAsyncItemRepository.h"
#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"
#import "NSObject+ERNHelper.h"
#import "ERNRepositoryPaginator.h"
#import "ERNNullRepositoryPaginator.h"
#import <RestKit/RestKit.h>

@interface ERNRestKitPagingAsyncItemsRepository ()
@property (nonatomic) id<ERNAsyncItemRepository> repository;
@property (nonatomic) id<ERNRepositoryPaginator> paginator;
@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) NSString *keyPath;
@property (nonatomic, readonly) NSString *pathPattern;
@property (nonatomic, readonly) RKObjectMapping *mapping;
@property (nonatomic, readonly) NSIndexSet *statusCodes;
@end

@implementation ERNRestKitPagingAsyncItemsRepository {
    NSURL *_url;
    id<ERNRepositoryPaginator> _paginator;
}

#pragma mark - public - constructors

+(instancetype)createWithUrl:(NSURL *)url
                     keyPath:(NSString *)keyPath
                     mapping:(RKObjectMapping *)mapping
                 statusCodes:(NSIndexSet *)statusCodes
{
    return [[self alloc] initWithUrl:url
                             keyPath:keyPath
                             mapping:mapping
                         statusCodes:statusCodes];
}

+(instancetype)createWithUrl:(NSURL *)url
                     keyPath:(NSString *)keyPath
                 pathPattern:(NSString *)pathPattern
                     mapping:(RKObjectMapping *)mapping
                 statusCodes:(NSIndexSet *)statusCodes
{
    return [[self alloc] initWithUrl:url
                             keyPath:keyPath
                         pathPattern:pathPattern
                             mapping:mapping
                         statusCodes:statusCodes];
}

#pragma mark - ERNAsyncItemsRepository

-(void)refresh
{
    [[self repository] removeObserver:self];
    [self setRepository:[ERNItemsToAsyncItemRepository
                         createWithRepository:[ERNRestKitAsyncItemsRepository
                                               createWithUrl:[self url]
                                               keyPath:[self keyPath]
                                               mapping:[self mapping]
                                               statusCodes:[self statusCodes]]]];
    [[self repository] addObserver:self
                          selector:@selector(repositoryRefreshed)];
}

-(NSUInteger)count
{
    return [[self paginator] count];
}

-(NSUInteger)offset
{
    return 0;
}

-(NSUInteger)limit
{
    return [[self array] count];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self indexWithinArray:index] ?
    [self array][index] :
    [self updatePageAndReturnNullObject];
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
                         createWithRepository:
                         [ERNRestKitAsyncItemsRepository
                          createWithUrl:[[self paginator] nextPage]
                          keyPath:[self keyPath]
                          mapping:[self mapping]
                          statusCodes:[self statusCodes]]]];
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
    return _url = _url ? _url : [NSURL createNull];
}

-(id<ERNRepositoryPaginator>)paginator
{
    return _paginator = _paginator ? _paginator : [ERNNullRepositoryPaginator create];
}

#pragma mark - private - initializers

-(id)initWithUrl:(NSURL *)url
         keyPath:(NSString *)keyPath
         mapping:(RKObjectMapping *)mapping
     statusCodes:(NSIndexSet *)statusCodes
{
    self = [self initWithUrl:url
                     keyPath:keyPath
                 pathPattern:nil
                     mapping:mapping
                 statusCodes:statusCodes];
    return self;
}

-(id)initWithUrl:(NSURL *)url
         keyPath:(NSString *)keyPath
     pathPattern:(NSString *)pathPattern
         mapping:(RKObjectMapping *)mapping
     statusCodes:(NSIndexSet *)statusCodes
{
    self = [super init];
    ERNCheckNil(self);
    _keyPath = keyPath;
    _pathPattern = pathPattern;
    _mapping = mapping;
    _statusCodes = statusCodes;
    _url = url;
    return self;
}

@end
