#import "ERNNullActionHandler.h"

static ERNNullActionHandler *immutableSingleton;

@implementation ERNNullActionHandler {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNActionHandler

-(void)actionForObject:(id<NSObject>) __unused object
{
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
