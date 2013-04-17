#import <UIKit/UIKit.h>

@protocol ERNViewControllerTransitioner <NSObject>
-(void)transitionToViewController:(UIViewController *)viewController;
@end
