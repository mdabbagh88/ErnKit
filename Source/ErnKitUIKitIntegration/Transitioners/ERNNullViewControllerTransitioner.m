#import <UIKit/UIKit.h>
#import "ERNNullViewControllerTransitioner.h"

static ERNNullViewControllerTransitioner *immutableSingleton;

@implementation ERNNullViewControllerTransitioner {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNViewControllerTransitioner

-(void)transitionToViewController:(UIViewController *) __unused viewController
{
}

#pragma mark - ERNViewControllerDismisser

-(void)dismissViewController:(UIViewController *) __unused viewController
{
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
