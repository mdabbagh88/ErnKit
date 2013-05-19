#import "ERNNullAsyncItemsRepository.h"

static ERNNullAsyncItemsRepository *immutableSingleton;

@implementation ERNNullAsyncItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNAsyncPaginatedItemsRepository

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

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self itemAtTotalIndex:index];
}

#pragma mark - ERNAsyncItemsRepository

-(NSUInteger)total
{
    return 0;
}

-(NSUInteger)offset
{
    return 0;
}

-(id<NSObject>)itemAtTotalIndex:(NSUInteger)index
{
    return [NSNull null];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
