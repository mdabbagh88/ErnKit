#import "ERNNullAsyncItemsRepository.h"

static ERNNullAsyncItemsRepository *immutableSingleton;

@implementation ERNNullAsyncItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNAsyncItemsRepository

-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block
{
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    return @[];
}

-(NSUInteger)total
{
    return 0;
}

-(NSUInteger)fetched
{
    return [self total];
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
    immutableSingleton = [self new];
}

@end
