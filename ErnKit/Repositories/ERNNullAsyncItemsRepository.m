#import "ERNNullAsyncItemsRepository.h"

static ERNNullAsyncItemsRepository *repository;

@implementation ERNNullAsyncItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)repository
{
    return repository;
}

#pragma mark - ERNAsyncItemsRepository

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

#pragma mark - NSObject

+(void)initialize
{
    repository = [[self alloc] init];
}

@end
