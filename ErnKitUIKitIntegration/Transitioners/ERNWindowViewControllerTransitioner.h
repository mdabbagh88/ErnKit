#import <Foundation/Foundation.h>
#import "ERNViewControllerTransitioner.h"

@class UIWindow;

@interface ERNWindowViewControllerTransitioner : NSObject <ERNViewControllerTransitioner>
+(instancetype)createWithWindow:(UIWindow *)window;
@end
