#import "ERNNullAsyncItemsRepository.h"

@implementation ERNNullAsyncItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
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

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [NSNull null];
}

@end
