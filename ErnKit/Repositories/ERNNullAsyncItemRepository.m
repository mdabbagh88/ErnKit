#import "ERNNullAsyncItemRepository.h"

static ERNNullAsyncItemRepository *repository;

@implementation ERNNullAsyncItemRepository {
}

#pragma mark - public - constructors

+(instancetype)repository
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
    repository = [[self alloc] init];
}

@end
