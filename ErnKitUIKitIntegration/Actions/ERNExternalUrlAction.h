#import <Foundation/Foundation.h>
#import "ERNAction.h"

@class UIApplication;

@interface ERNExternalUrlAction : NSObject <ERNAction>
+(instancetype)actionWithApplication:(UIApplication *)application;
@end
