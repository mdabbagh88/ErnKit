#import "ERNNullObjectAction.h"
#import "ERNErrorHandler.h"

@implementation ERNNullObjectAction {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNObjectAction

-(void)actionForObject:(id<NSObject>) __unused object
{
}

@end
