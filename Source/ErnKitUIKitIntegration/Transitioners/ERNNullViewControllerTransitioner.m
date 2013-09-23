#import "ERNNullViewControllerTransitioner.h"
#import "ERNErrorHandler.h"

@implementation ERNNullViewControllerTransitioner {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNViewControllerTransitioner

-(void)transitionToViewController:(UIViewController *) __unused viewController
{
}

#pragma mark - ERNViewControllerDismisser

-(void)dismissViewController:(UIViewController *) __unused viewController
{
}

@end
