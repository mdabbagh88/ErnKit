#import "ERNItemsToAsyncPaginatedItemsRepository.h"
#import "ERNErrorHandler.h"

@interface ERNItemsToAsyncPaginatedItemsRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> repository;
@end

@implementation ERNItemsToAsyncPaginatedItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithItemsRepository:repository];
}

#pragma mark - ERNAsyncPaginatedItemsRepository

-(NSUInteger)fetched
{
    return [[self repository] total];
}

-(NSUInteger)offset
{
    return 0;
}

#pragma mark - ERNAsyncItemsRepository

-(NSUInteger)total
{
    return [[self repository] total];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [[self repository] itemAtIndex:index];
}

-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block
{
    ERNCheckNilNoReturn(block);
    [[self repository] enumerateItemsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    ERNCheckNilAndReturn(predicate, @[]);
    return [[self repository] filteredArrayUsingPredicate:predicate];
}

#pragma mark - private - initializers

-(id)initWithItemsRepository:(id<ERNAsyncItemsRepository>)repository
{
    self = [super initWithRepository:repository];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

@end
