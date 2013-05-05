#import "ERNRoutingAsyncItemsRepository.h"
#import "ERNErrorHandler.h"

@interface ERNRoutingAsyncItemsRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> firstRepository;
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> restRepository;
@end

@implementation ERNRoutingAsyncItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)repositoryWithFirstRepository:(id<ERNAsyncItemsRepository>)firstRepository
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

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self firstIndex:index] ?
    [[self firstRepository] itemAtIndex:index] :
    [[self restRepository] itemAtIndex:[self indexForRest:index]];
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
