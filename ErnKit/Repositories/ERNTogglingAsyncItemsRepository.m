#import "ERNTogglingAsyncItemsRepository.h"
#import "NSObject+ERNHelper.h"
#import "ERNErrorHandler.h"
#import "ERNNullAsyncItemsRepository.h"

@interface ERNTogglingAsyncItemsRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository>currentRepository;
@property (nonatomic, readonly) NSArray *repositories;
@end

@implementation ERNTogglingAsyncItemsRepository {
}

#pragma mark - public - constructor

+(instancetype)repositoryWithRepositories:(NSArray *)repositories
{
    return [[self alloc] initWithRepositories:repositories];
}

#pragma mark - ERNToggler

-(void)toggleToIndex:(NSUInteger)index
{
    [self removeSelfAsObserverFromCurrentRepository];
    [self changeCurrentRepositoryToIndex:index];
    [self addSelfAsObserverToCurrentRepository];
    [self notifyObservers];
}

#pragma mark - ERNAsyncItemsRepository

-(NSUInteger)count
{
    return [[self currentRepository] count];
}

-(NSUInteger)limit
{
    return [[self currentRepository] limit];
}

-(NSUInteger)offset
{
    return [[self currentRepository] offset];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self currentRepository][index];
}

-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block
{
    [[self currentRepository] enumerateItemsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    return [[self currentRepository] filteredArrayUsingPredicate:predicate];
}

#pragma mark - ERNAsyncRepository

-(void)refresh
{
    [[self repositories] enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        [[self validRepository:object] refresh];
    }];
}

#pragma mark - NSObject

-(void)dealloc
{
    [self removeSelfAsObserverFromCurrentRepository];
}

#pragma mark - private

-(void)changeCurrentRepositoryToIndex:(NSUInteger)index
{
    _currentRepository = [self validRepository:[self repositoryAtIndex:index]];
}

-(id<ERNAsyncItemsRepository>)nullRepositoryIfNil:(id<ERNAsyncItemsRepository>)repository
{
    return repository ? repository : [ERNNullAsyncItemsRepository repository];
}

-(id<ERNAsyncItemsRepository>)validRepository:(id)repository
{
    return [self nullRepositoryIfNil:
            [repository guaranteeProtocolConformance:@protocol(ERNAsyncItemsRepository)]];
}

-(id<ERNAsyncItemsRepository>)repositoryAtIndex:(NSUInteger)index
{
    return [self repositories][index];
}

-(void)removeSelfAsObserverFromCurrentRepository
{
    [[self currentRepository] removeObserver:self];
}

-(void)addSelfAsObserverToCurrentRepository
{
    [[self currentRepository] addObserver:self
                                 selector:@selector(currentRepositoryRefreshed)];
}

-(void)currentRepositoryRefreshed
{
    [self notifyObservers];
}

#pragma mark - private - initializers

-(id)initWithRepositories:(NSArray *)repositories
{
    self = [self init];
    ERNCheckNil(self);
    _repositories = repositories;
    [self changeCurrentRepositoryToIndex:0];
    [self addSelfAsObserverToCurrentRepository];
    return self;
}

@end
