#import "ERNMergingAsyncPaginatedItemsRepository.h"
#import "ERNErrorHandler.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"

@interface ERNMergingAsyncPaginatedItemsRepository ()
@property (nonatomic, readonly) id<ERNAsyncPaginatedItemsRepository> firstRepository;
@property (nonatomic, readonly) id<ERNAsyncPaginatedItemsRepository> restRepository;
@end

@implementation ERNMergingAsyncPaginatedItemsRepository {
    id<ERNAsyncPaginatedItemsRepository> _firstRepository;
    id<ERNAsyncPaginatedItemsRepository> _restRepository;
}

#pragma mark - public - constructors

+(instancetype)createWithFirstRepository:(id<ERNAsyncPaginatedItemsRepository>)firstRepository
                          restRepository:(id<ERNAsyncPaginatedItemsRepository>)restRepository
{
    return [[self alloc] initWithFirstRepository:firstRepository
                                  restRepository:restRepository];
}

#pragma mark - ERNAsyncPaginatedItemsRepository

-(NSUInteger)total
{
    return [[self firstRepository] total] + [[self restRepository] total];
}

-(NSUInteger)offset
{
    return [self useFirstOnly] ?
    [[self firstRepository] offset] :
    [self useRestOnly] ?
    [[self firstRepository] total] + [[self restRepository] offset] :
    [[self firstRepository] offset];
}

-(BOOL)hasNext
{
    return [self useFirstOnly] ?
    [[self firstRepository] hasNext] :
    [self useRestOnly] ?
    [[self restRepository] hasNext] :
    [[self restRepository] hasNext];
}

-(BOOL)hasPrevious
{
    return [self useFirstOnly] ?
    [[self firstRepository] hasPrevious] :
    [self useRestOnly] ?
    [[self restRepository] hasPrevious] :
    [[self firstRepository] hasPrevious];
}

-(void)fetchNext
{
    if ([self useFirstOnly]) {
        [[self firstRepository] fetchNext];
    } else if ([self useRestOnly]) {
        [[self restRepository] fetchNext];
    } else {
        [[self restRepository] fetchNext];
    }
}

-(void)fetchPrevious
{
    if ([self useFirstOnly]) {
        [[self firstRepository] fetchPrevious];
    } else if ([self useRestOnly]) {
        [[self restRepository] fetchPrevious];
    } else {
        [[self firstRepository] fetchPrevious];
    }
}

#pragma mark - ERNAsyncItemsRepository

-(NSUInteger)count
{
    return [self useFirstOnly] ?
    [[self firstRepository] count] :
    [self useRestOnly] ?
    [[self restRepository] count] :
    [[self firstRepository] count] + [[self restRepository] count];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self useFirstOnly] ?
            [[self firstRepository] itemAtIndex:index] :
            [self useRestOnly] ?
            [[self restRepository] itemAtIndex:index] :
            [self indexInFirst:index] ?
            [[self firstRepository] itemAtIndex:index] :
            [[self restRepository] itemAtIndex:index - [[self firstRepository] count]];
}

-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block
{
    if ([self useFirstOnly]) {
        [[self firstRepository] enumerateItemsUsingBlock:block];
    } else if ([self useRestOnly]) {
        [[self restRepository] enumerateItemsUsingBlock:block];
    } else {
        [[self firstRepository] enumerateItemsUsingBlock:block];
        [[self restRepository] enumerateItemsUsingBlock:block];
    }
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    return [self useFirstOnly] ?
            [[self firstRepository] filteredArrayUsingPredicate:predicate] :
            [self useRestOnly] ?
            [[self restRepository] filteredArrayUsingPredicate:predicate] :
            [[[self firstRepository] filteredArrayUsingPredicate:predicate]
             arrayByAddingObjectsFromArray:[[self restRepository]
                                            filteredArrayUsingPredicate:predicate]];
}

#pragma mark - ERNAsyncRepository

-(void)refresh
{
    [[self firstRepository] refresh];
    [[self restRepository] refresh];
}

#pragma mark - NSObject

-(void)dealloc
{
    [_firstRepository removeObserver:self];
    [_restRepository removeObserver:self];
}

#pragma mark - private

-(BOOL)useFirstOnly
{
    return [[self firstRepository] count] + [[self firstRepository] offset] <
    [[self firstRepository] total];
}

-(BOOL)useRestOnly
{
    return ![self useFirstOnly] && [[self restRepository] offset] > 0;
}

-(BOOL)indexInFirst:(NSUInteger)index
{
    return index < [[self firstRepository] count];
}

-(void)subRepositoriesRefreshed
{
    [self notifyObservers];
}

#pragma mark - private - accessors

-(id<ERNAsyncPaginatedItemsRepository>)firstRepository
{
    return _firstRepository = _firstRepository ? _firstRepository :
    [ERNNullAsyncPaginatedItemsRepository create];
}

-(id<ERNAsyncPaginatedItemsRepository>)restRepository
{
    return _restRepository = _restRepository ? _restRepository :
    [ERNNullAsyncPaginatedItemsRepository create];
}

#pragma mark - private - initializers

-(id)initWithFirstRepository:(id<ERNAsyncPaginatedItemsRepository>)firstRepository
              restRepository:(id<ERNAsyncPaginatedItemsRepository>)restRepository
{
    self = [super init];
    ERNCheckNil(self);
    _firstRepository = firstRepository;
    _restRepository = restRepository;
    [[self firstRepository] addObserver:self
                               selector:@selector(subRepositoriesRefreshed)];
    [[self restRepository] addObserver:self
                              selector:@selector(subRepositoriesRefreshed)];
    return self;
}

@end
