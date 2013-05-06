#import <Foundation/Foundation.h>
#import "ERNActionSheetTransitioner.h"

@class UIView;

@interface ERNViewActionSheetTransitioner : NSObject <ERNActionSheetTransitioner>
+(instancetype)transitionerWithView:(UIView *)view;
@end
