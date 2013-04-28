#import <UIKit/UIKit.h>
#import "ERNActionSheetTransitioner.h"

@interface ERNActionSheetViewTransitioner : NSObject <ERNActionSheetTransitioner>
+(instancetype)transitionerWithView:(UIView *)view;
@end
