#import "ERNNullObjectAction.h"

static ERNNullObjectAction *immutableSingleton;

@implementation ERNNullObjectAction {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNObjectAction

-(void)actionForObject:(id<NSObject>) __unused object
{
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
