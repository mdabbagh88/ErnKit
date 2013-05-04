#import <Foundation/Foundation.h>
#import "ERNViewControllerTransitioner.h"

@class UIViewController;

@interface ERNModalViewControllerTransitioner : NSObject <ERNViewControllerTransitioner>
+(instancetype)transitionerWithSourceViewController:(UIViewController *)sourceViewController;
@end
