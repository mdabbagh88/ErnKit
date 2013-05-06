#import <Foundation/Foundation.h>
#import "ERNActionSheetTransitioner.h"

@class UIBarButtonItem;

@interface ERNBarButtonItemActionSheetTransitioner : NSObject <ERNActionSheetTransitioner>
+(instancetype)transitionerWithBarButtonItem:(UIBarButtonItem *)barButtonItem;
@end
