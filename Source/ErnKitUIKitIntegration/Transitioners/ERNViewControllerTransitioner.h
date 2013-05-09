#import <Foundation/Foundation.h>

@class UIViewController;

@protocol ERNViewControllerTransitioner <NSObject>
-(void)transitionToViewController:(UIViewController *)viewController;
@end
