#import "ERNNullAsyncItemRepository.h"

static ERNNullAsyncItemRepository *immutableSingleton;

@implementation ERNNullAsyncItemRepository {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNAsyncItemRepository

-(id<NSObject>)item
{
    return [NSNull null];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
