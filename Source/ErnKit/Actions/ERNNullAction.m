#import "ERNNullAction.h"
#import "ERNErrorHandler.h"

@implementation ERNNullAction {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *) __unused resource
{
}

@end
