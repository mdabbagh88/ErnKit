#import "ERNNullAsyncItemRepository.h"

@implementation ERNNullAsyncItemRepository {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNAsyncItemRepository

-(id<NSObject>)item
{
    return [NSNull null];
}

@end
