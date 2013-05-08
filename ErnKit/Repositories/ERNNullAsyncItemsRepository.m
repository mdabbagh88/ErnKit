#import "ERNNullAsyncItemsRepository.h"

static ERNNullAsyncItemsRepository *repository;

@implementation ERNNullAsyncItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return repository;
}

#pragma mark - ERNAsyncItemsRepository

-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block
{
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    return @[];
}

-(NSUInteger)count
{
    return 0;
}

-(NSUInteger)limit
{
    return [self count];
}

-(NSUInteger)offset
{
    return 0;
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [NSNull null];
}

#pragma mark - NSObject

+(void)initialize
{
    repository = [self new];
}

@end
