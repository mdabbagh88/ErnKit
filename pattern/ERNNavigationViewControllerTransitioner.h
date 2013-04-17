#import <UIKit/UIKit.h>
#import "ERNViewControllerTransitioner.h"

@interface ERNNavigationViewControllerTransitioner : NSObject <ERNViewControllerTransitioner>
+(instancetype)transitionerWithNavigationController:(UINavigationController *)navigationController;
@end
