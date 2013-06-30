#import "ERNTogglingAsyncPaginatedItemsRepository.h"
#import "NSObject+ERNHelper.h"
#import "ERNErrorHandler.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"

@interface ERNTogglingAsyncPaginatedItemsRepository ()
@property (nonatomic, readonly) id<ERNAsyncPaginatedItemsRepository>currentRepository;
@property (nonatomic, readonly) NSArray *repositories;
@end

@implementation ERNTogglingAsyncPaginatedItemsRepository {
    NSUInteger _selectedIndex;
}

#pragma mark - public - constructor

+(instancetype)createWithRepositories:(NSArray *)repositories
{
    return [[self alloc] initWithRepositories:repositories];
}

#pragma mark - ERNToggler

-(void)setSelectedIndex:(NSUInteger)index
{
    _selectedIndex = index;
    [self removeSelfAsObserverFromCurrentRepository];
    [self changeCurrentRepositoryToIndex:index];
    [self addSelfAsObserverToCurrentRepository];
    [self notifyObservers];
}

-(NSUInteger)selectedIndex
{
    return _selectedIndex;
}

#pragma mark - ERNAsyncPaginatedItemsRepository

-(NSUInteger)total
{
    return [[self currentRepository] total];
}

-(NSUInteger)offset
{
    return [[self currentRepository] offset];
}

-(void)fetchPrevious
{
    [[self currentRepository] fetchPrevious];
}

-(void)fetchNext
{
    [[self currentRepository] fetchNext];
}

-(BOOL)hasNext
{
    return [[self currentRepository] hasNext];
}

-(BOOL)hasPrevious
{
    return [[self currentRepository] hasPrevious];
}

#pragma mark - ERNAsyncItemsRepository

-(NSUInteger)count
{
    return [[self currentRepository] count];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [[self currentRepository] itemAtIndex:index];
}

-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block
{
    ERNCheckNilNoReturn(block);
    [[self currentRepository] enumerateItemsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    ERNCheckNilAndReturn(predicate, @[]);
    return [[self currentRepository] filteredArrayUsingPredicate:predicate];
}

#pragma mark - ERNAsyncRepository

-(void)refresh
{
    [[self repositories] enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        [[self validRepository:object] refresh];
    }];
    [self notifyObservers];
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

-(id<ERNAsyncPaginatedItemsRepository>)
validRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
{
    return [self isValidRepository:repository] ? repository :
    [ERNNullAsyncPaginatedItemsRepository create];
}

-(BOOL)isValidRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
{
    return repository &&
    [repository conformsToProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
}

-(id<ERNAsyncPaginatedItemsRepository>)repositoryAtIndex:(NSUInteger)index
{
    return index < [[self repositories] count] ?
    [self repositories][index] :
    [ERNNullAsyncItemsRepository create];
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
    _selectedIndex = 0;
    [self changeCurrentRepositoryToIndex:0];
    [self addSelfAsObserverToCurrentRepository];
    return self;
}

@end
