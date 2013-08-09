#import "ERNNullTableViewDelegate.h"

static ERNNullTableViewDelegate *immutableSingleton;

@implementation ERNNullTableViewDelegate {
}

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
