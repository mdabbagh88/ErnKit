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

-(NSUInteger)count
{
    return [[self firstRepository] count] + [[self restRepository] count];
}

-(NSUInteger)limit
{
    return [self limitWithRestOffset:[[self restRepository] offset]
                           restLimit:[[self restRepository] limit]];
}

-(NSUInteger)offset
{
    return [self offsetWithRestOffset:[[self restRepository] offset]];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self firstIndex:index] ?
    [self firstRepository][index] :
    [self restRepository][[self indexForRest:index]];
}

-(void)enumerateItemsUsingBlock:(void (^)(id<NSObject> item, NSUInteger index, BOOL *stop))block
{
    [[self firstRepository] enumerateItemsUsingBlock:block];
    [[self restRepository] enumerateItemsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    return [[[self firstRepository]
             filteredArrayUsingPredicate:predicate]
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

-(NSUInteger)offsetWithRestOffset:(NSUInteger)restOffset
{
    return restOffset > 0 ?
    [[self firstRepository] count] + restOffset :
    [[self firstRepository] offset];
}

-(NSUInteger)limitWithRestOffset:(NSUInteger)restOffset
                       restLimit:(NSUInteger)restLimit
{
    return restOffset > 0 ?
    restLimit :
    [self limitWithFirstLimit:[[self firstRepository] limit]
                   firstCount:[[self firstRepository] count]
                    restLimit:restLimit];

}

-(NSUInteger)limitWithFirstLimit:(NSUInteger)firstLimit
                      firstCount:(NSUInteger)firstCount
     restLimit:(NSUInteger)restLimit
{
    return ((firstLimit + [[self firstRepository] offset]) < firstCount) ?
    firstLimit :
    firstCount + restLimit;
}

-(BOOL)firstIndex:(NSUInteger)index
{
    return index < [[self firstRepository] count];
}

-(NSUInteger)indexForRest:(NSUInteger)index
{
    return index - [[self firstRepository] count];
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
