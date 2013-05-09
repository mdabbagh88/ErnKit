#import <Foundation/Foundation.h>
#import "ERNActionSheetTransitioner.h"

@class UIBarButtonItem;

@interface ERNBarButtonItemActionSheetTransitioner : NSObject <ERNActionSheetTransitioner>
+(instancetype)createWithBarButtonItem:(UIBarButtonItem *)barButtonItem;
@end
