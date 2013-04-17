#import <UIKit/UIKit.h>
#import "ERNViewControllerTransitioner.h"

@interface ERNModalViewControllerTransitioner : NSObject <ERNViewControllerTransitioner>
+(instancetype)transitionerWithSourceViewController:(UIViewController *)sourceViewController;
@end
