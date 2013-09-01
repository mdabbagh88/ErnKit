#import <Foundation/Foundation.h>
#import "ERNActionSheetFactory.h"

@interface ERNNullActionSheetFactory : NSObject <ERNActionSheetFactory>
+(instancetype)create;
@end
