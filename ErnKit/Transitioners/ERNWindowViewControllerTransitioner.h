#import <UIKit/UIKit.h>
#import "ERNViewControllerTransitioner.h"

@interface ERNWindowViewControllerTransitioner : NSObject <ERNViewControllerTransitioner>
+(instancetype)transitionerWithWindow:(UIWindow *)window;
@end
