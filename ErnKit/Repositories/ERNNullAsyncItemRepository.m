#import "ERNNullAsyncItemRepository.h"

@implementation ERNNullAsyncItemRepository {
}

#pragma mark - public - constructors

+(instancetype)repository
{
    return [[self alloc] init];
}

#pragma mark - ERNAsyncItemRepository

-(id<NSObject>)item
{
    return [NSNull null];
}

@end
