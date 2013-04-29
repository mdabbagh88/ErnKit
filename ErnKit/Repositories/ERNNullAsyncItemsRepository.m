#import "ERNNullAsyncItemsRepository.h"

@implementation ERNNullAsyncItemsRepository

static ERNNullAsyncItemsRepository *repository;

-(void)enumerateItemsUsingBlock:(void (^)(id<NSObject>, NSUInteger, BOOL *))block
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

+(instancetype)repository
{
    return repository;
}

+(void)initialize
{
    repository = [[self alloc] init];
}

@end
