#import "ERNNullAsyncItemsRepository.h"

@implementation ERNNullAsyncItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNAsyncItemsRepository

-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)__unused block
{
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)__unused predicate
{
    return @[];
}

-(NSUInteger)count
{
    return 0;
}

-(id<NSObject>)itemAtIndex:(NSUInteger)__unused index
{
    return [NSNull null];
}

@end
