#import "ERNNullViewControllerDismisser.h"
#import "ERNErrorHandler.h"

@implementation ERNNullViewControllerDismisser {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNViewControllerDismisser

-(void)dismissViewController:(UIViewController *) __unused viewController
{
}

@end
