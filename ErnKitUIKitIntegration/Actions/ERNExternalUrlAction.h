#import <Foundation/Foundation.h>
#import "ERNAction.h"

@class UIApplication;

@interface ERNExternalUrlAction : NSObject <ERNAction>
+(instancetype)createWithApplication:(UIApplication *)application;
@end
