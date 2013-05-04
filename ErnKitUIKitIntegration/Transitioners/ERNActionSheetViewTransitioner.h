#import <Foundation/Foundation.h>
#import "ERNActionSheetTransitioner.h"

@class UIView;

@interface ERNActionSheetViewTransitioner : NSObject <ERNActionSheetTransitioner>
+(instancetype)transitionerWithView:(UIView *)view;
@end
