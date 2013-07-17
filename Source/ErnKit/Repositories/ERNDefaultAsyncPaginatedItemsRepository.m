#import "ERNDefaultAsyncPaginatedItemsRepository.h"
#import "ERNPaginatedItemsToItemRepository.h"
#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"
#import "NSObject+ERNHelper.h"
#import "ERNRepositoryPaginator.h"
#import "ERNNullRepositoryPaginator.h"
#import "ERNItemsToAsyncPaginatedItemsRepository.h"
#import "ERNItemRepositoryFactory.h"
#import "ERNNullResource.h"
#import "ERNNullItemRepositoryFactory.h"

@interface ERNDefaultAsyncPaginatedItemsRepository ()
@property (nonatomic) id<ERNAsyncItemRepository> repository;
@property (nonatomic, readonly) id<ERNItemRepositoryFactory> itemRepositoryFactory;
@property (nonatomic, readonly) ERNResource *resource;
@property (nonatomic, readonly) NSUInteger windowSize;
@property (nonatomic, readonly) NSMutableArray *pages;
@property (nonatomic, assign) NSUInteger offset;
@end

@implementation ERNDefaultAsyncPaginatedItemsRepository {
    ERNResource *_resource;
    id<ERNItemRepositoryFactory> _itemRepositoryFactory;
    NSUInteger _windowSize;
    NSMutableArray *_pages;
    NSUInteger _offset;
}

#pragma mark - public - constructors

+(instancetype)createWithResource:(ERNResource *)resource
            itemRepositoryFactory:(id<ERNItemRepositoryFactory>)itemRepositoryFactory
                       windowSize:(NSUInteger)windowSize
{
    return [[self alloc] initWithResource:resource
                    itemRepositoryFactory:itemRepositoryFactory
                               windowSize:windowSize];
}

#pragma mark - ERNAsyncItemsRepository

-(void)refresh
{
    [[self repository] removeObserver:self];
    [self setRepository:[[self itemRepositoryFactory] itemRepositoryForResource:[self resource]]];
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
    return [[[[self pages] lastObject] nextPage] ERN_hasValue] ?
    [[(id<ERNRepositoryPaginator>)[[self pages] lastObject] total] unsignedIntegerValue] :
    [self count] + [self offset];
}

-(void)fetchPrevious
{
    [[self repository] removeObserver:self];
    [self setRepository:
     [[self itemRepositoryFactory] itemRepositoryForResource:
      [ERNResource createWithUrl:[[[self pages] objectAtIndex:0] previousPage]
                            mime:@""]]];
    [[self repository] addObserver:self
                          selector:@selector(repositoryPreviousPageRefreshed)];
    [[self repository] refresh];
}

-(BOOL)hasPrevious
{
    return [[[[self pages] objectAtIndex:0] previousPage] ERN_hasValue];
}

-(BOOL)hasNext
{
    return [[[[self pages] lastObject] nextPage] ERN_hasValue];
}

-(void)fetchNext
{
    [[self repository] removeObserver:self];
    [self setRepository:
     [[self itemRepositoryFactory] itemRepositoryForResource:
      [ERNResource createWithUrl:[[[self pages] lastObject] nextPage]
                            mime:@""]]];
    [[self repository] addObserver:self
                          selector:@selector(repositoryNextPageRefreshed)];
    [[self repository] refresh];
}

#pragma mark - NSObject

-(void)dealloc
{
    [_repository removeObserver:self];
}

#pragma mark - private

-(void)repositoryRefreshed
{
    [[self pages] removeAllObjects];
    [[self pages] addObject:validatePaginator([[self repository] item])];
    [self setArray:[[[self pages] objectAtIndex:0] items]];
}

-(void)repositoryNextPageRefreshed
{

    [[self pages] addObject:validatePaginator([[self repository] item])];
    if (([[[[self pages] lastObject] items] count] + [[self array] count]) >
        [self windowSize]) {
        [self setOffset:[self offset] + [[[[self pages] objectAtIndex:0] items] count]];
        [[self pages] removeObjectAtIndex:0];
    }
    [self refreshArray];
}

-(void)repositoryPreviousPageRefreshed
{
    [[self pages] insertObject:validatePaginator([[self repository] item])
                       atIndex:0];
    [self setOffset:[self offset] - [[[[self pages] objectAtIndex:0] items] count]];
    if (([[[[self pages] objectAtIndex:0] items] count] + [[self array] count]) >
        [self windowSize]) {
        [[self pages] removeLastObject];
    }
    [self refreshArray];
}

-(void)refreshArray
{
    NSMutableArray *newArray = [NSMutableArray array];
    [[self pages] enumerateObjectsUsingBlock:
     ^(id<ERNRepositoryPaginator> page, __unused NSUInteger index, __unused BOOL *stop) {
         [newArray addObjectsFromArray:[page items]];
     }];
    [self setArray:newArray];
}


static id<ERNRepositoryPaginator> validatePaginator(id paginator)
{
    return paginator && [paginator conformsToProtocol:@protocol(ERNRepositoryPaginator)] ?
    paginator :
    [ERNNullRepositoryPaginator create];
}

#pragma mark - private - accessors

-(ERNResource *)resource
{
    return _resource = _resource ? _resource : [ERNNullResource create];
}

-(id<ERNItemRepositoryFactory>)itemRepositoryFactory
{
    return _itemRepositoryFactory = _itemRepositoryFactory ? _itemRepositoryFactory :
    [ERNNullItemRepositoryFactory create];
}

#pragma mark - private - initializers

-(id)initWithResource:(ERNResource *)resource
itemRepositoryFactory:(id<ERNItemRepositoryFactory>)itemRepositoryFactory
           windowSize:(NSUInteger)windowSize
{
    self = [super init];
    ERNCheckNil(self);
    _resource = resource;
    _itemRepositoryFactory = itemRepositoryFactory;
    _windowSize = windowSize;
    _pages = [NSMutableArray array];
    _offset = 0;
    return self;
}

@end
