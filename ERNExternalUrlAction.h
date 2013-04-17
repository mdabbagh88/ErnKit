#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNExternalUrlAction : NSObject <ERNAction>
+(instancetype)actionWithApplication:(UIApplication *)application;
@end
