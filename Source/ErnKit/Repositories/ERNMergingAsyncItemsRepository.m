#import "ERNMergingAsyncItemsRepository.h"
#import "ERNErrorHandler.h"

@interface ERNMergingAsyncItemsRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> firstRepository;
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> restRepository;
@end

@implementation ERNMergingAsyncItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)createWithFirstRepository:(id<ERNAsyncItemsRepository>)firstRepository
                          restRepository:(id<ERNAsyncItemsRepository>)restRepository
{
    return [[self alloc] initWithFirstRepository:firstRepository
                                  restRepository:restRepository];
}

#pragma mark - ERNAsyncItemsRepository

-(NSUInteger)total
{
    return [[self firstRepository] total] + [[self restRepository] total];
}

-(NSUInteger)fetched
{
    return [self limitWithFirstCount:[[self firstRepository] total]
                          firstLimit:[[self firstRepository] fetched]
                         firstOffset:[[self firstRepository] offset]
                           restCount:[[self restRepository] total]
                           restLimit:[[self restRepository] fetched]
                          restOffset:[[self restRepository] offset]];
}

-(NSUInteger)offset
{
    return [[self firstRepository] total] == 0 ?
    [[self restRepository] offset] :
    [[self firstRepository] offset];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self validItem:[self firstIndex:index] ?
    [[self firstRepository] itemAtIndex:index] :
            [self restIndex:index] ?
            [[self restRepository] itemAtIndex:[self indexForRest:index]] :
            [NSNull null]];
}

-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block
{
    [[self firstRepository] enumerateItemsUsingBlock:block];
    [[self restRepository] enumerateItemsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    return [self validArray:[[[self firstRepository]
             filteredArrayUsingPredicate:predicate]
            arrayByAddingObjectsFromArray:[[self restRepository]
                                           filteredArrayUsingPredicate:predicate]]];
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

-(NSUInteger)limitWithFirstCount:(NSUInteger)firstCount
                      firstLimit:(NSUInteger)firstLimit
                     firstOffset:(NSUInteger)firstOffset
                       restCount:(NSUInteger)restCount
                       restLimit:(NSUInteger)restLimit
                      restOffset:(NSUInteger)restOffset
{
    return (restCount == 0) ? firstLimit :
    (firstCount == 0) ? restLimit : restLimit + firstCount - firstOffset + restOffset;
}

-(NSArray *)validArray:(NSArray *)array
{
    return array ? array : @[];
}

-(id<NSObject>)validItem:(id<NSObject>)item
{
    return item ? item : [NSNull null];
}

-(BOOL)firstIndex:(NSUInteger)index
{
    return index < [[self firstRepository] total];
}

-(BOOL)restIndex:(NSUInteger)index
{
    return index >= [[self firstRepository] total] && index < [self total];
}

-(NSUInteger)indexForRest:(NSUInteger)index
{
    return index - [[self firstRepository] total];
}

-(void)subRepositoriesRefreshed
{
    [self notifyObservers];
}

#pragma mark - private - initializers

-(id)initWithFirstRepository:(id<ERNAsyncItemsRepository>)firstRepository
              restRepository:(id<ERNAsyncItemsRepository>)restRepository
{
    self = [self init];
    ERNCheckNil(self);
    _firstRepository = firstRepository;
    _restRepository = restRepository;
    [_firstRepository addObserver:self
                         selector:@selector(subRepositoriesRefreshed)];
    [_restRepository addObserver:self
                        selector:@selector(subRepositoriesRefreshed)];
    return self;
}

@end
