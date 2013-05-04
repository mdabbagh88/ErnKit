#import <Foundation/Foundation.h>
#import "ERNViewControllerTransitioner.h"

@class UINavigationController;

@interface ERNNavigationViewControllerTransitioner : NSObject <ERNViewControllerTransitioner>
+(instancetype)transitionerWithNavigationController:(UINavigationController *)navigationController;
@end
