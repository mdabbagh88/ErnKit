#import <Foundation/Foundation.h>
#import "ERNViewControllerDismisser.h"

@class UIViewController;

@protocol ERNViewControllerTransitioner <ERNViewControllerDismisser>
-(void)transitionToViewController:(UIViewController *)viewController;
@end
