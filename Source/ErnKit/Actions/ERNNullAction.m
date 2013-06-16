#import "ERNNullAction.h"

static ERNNullAction *immutableSingleton;

@implementation ERNNullAction {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
