#import <Foundation/Foundation.h>
#import "ERNActionSheetTransitioner.h"

@class UIView;

@interface ERNViewActionSheetTransitioner : NSObject <ERNActionSheetTransitioner>
+(instancetype)createWithView:(UIView *)view;
@end
