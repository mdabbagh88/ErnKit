#import <UIKit/UIKit.h>
#import "ERNNullViewControllerDismisser.h"

static ERNNullViewControllerDismisser *immutableSingleton;

@implementation ERNNullViewControllerDismisser {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
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
