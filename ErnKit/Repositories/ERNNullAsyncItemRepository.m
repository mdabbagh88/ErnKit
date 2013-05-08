#import "ERNNullAsyncItemRepository.h"

static ERNNullAsyncItemRepository *repository;

@implementation ERNNullAsyncItemRepository {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return repository;
}

#pragma mark - ERNAsyncItemRepository

-(id<NSObject>)item
{
    return [NSNull null];
}

#pragma mark - NSObject

+(void)initialize
{
    repository = [self new];
}

@end
