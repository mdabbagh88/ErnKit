#import "ERNNullMapViewDelegate.h"

ERNNullMapViewDelegate *immutableSingleton;

@implementation ERNNullMapViewDelegate

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
