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
@property (nonatomic, readonly) RKResponseDescriptor *responseDescriptor;
@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) NSUInteger windowSize;
@property (nonatomic, readonly) NSMutableArray *pages;
@property (nonatomic, readwrite) NSUInteger offset;
@end

@implementation ERNRestKitPagingAsyncItemsRepository {
    NSURL *_url;
    NSUInteger _windowSize;
    NSMutableArray *_pages;
    NSUInteger _offset;
}

#pragma mark - public - constructors

+(instancetype)createWithUrl:(NSURL *)url
          responseDescriptor:(RKResponseDescriptor *)responseDescriptor
                  windowSize:(NSUInteger)windowSize
{
    return [[self alloc] initWithUrl:url
                  responseDescriptor:responseDescriptor
                          windowSize:windowSize];
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
    return [[[[self pages] lastObject] nextPage] ERN_hasValue] ?
    [[(id<ERNRepositoryPaginator>)[[self pages] lastObject] total] unsignedIntegerValue] :
    [self count] + [self offset];
}

-(void)fetchPrevious
{
    [[self repository] removeObserver:self];
    [self setRepository:[ERNItemsToAsyncItemRepository
                         createWithRepository:
                         [ERNItemsToAsyncPaginatedItemsRepository createWithRepository:
                         [ERNRestKitAsyncItemsRepository
                          createWithUrl:[[[self pages] objectAtIndex:0] previousPage]
                          responseDescriptor:[self responseDescriptor]]]]];
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
    [self setRepository:[ERNItemsToAsyncItemRepository
                         createWithRepository:
                         [ERNItemsToAsyncPaginatedItemsRepository createWithRepository:
                         [ERNRestKitAsyncItemsRepository
                          createWithUrl:[[[self pages] lastObject] nextPage]
                          responseDescriptor:[self responseDescriptor]]]]];
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

-(BOOL)indexWithinArray:(NSUInteger)index
{
    return index < [[self array] count];
}

-(void)repositoryRefreshed
{
    [[self pages] removeAllObjects];
    [[self pages] addObject:[self validatePaginator:[[self repository] item]]];
    [self setArray:[[[self pages] objectAtIndex:0] items]];
}

-(void)repositoryNextPageRefreshed
{

    [[self pages] addObject:[self validatePaginator:[[self repository] item]]];
    if (([[[[self pages] lastObject] items] count] + [[self array] count]) >
        [self windowSize]) {
        [self setOffset:[self offset] + [[[[self pages] objectAtIndex:0] items] count]];
        [[self pages] removeObjectAtIndex:0];
    }
    [self refreshArray];
}

-(void)repositoryPreviousPageRefreshed
{
    [[self pages] insertObject:[self validatePaginator:[[self repository] item]]
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
     ^(id<ERNRepositoryPaginator> page, NSUInteger index, BOOL *stop) {
        [newArray addObjectsFromArray:[page items]];
     }];
    [self setArray:newArray];
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

#pragma mark - private - initializers

-(id)initWithUrl:(NSURL *)url
responseDescriptor:(RKResponseDescriptor *)responseDescriptor
      windowSize:(NSUInteger)windowSize
{
    self = [super init];
    ERNCheckNil(self);
    _url = url;
    _responseDescriptor = responseDescriptor;
    _windowSize = windowSize;
    _pages = [NSMutableArray array];
    _offset = 0;
    return self;
}

@end
