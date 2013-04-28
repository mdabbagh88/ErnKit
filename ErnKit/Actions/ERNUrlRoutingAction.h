#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNUrlRoutingAction : NSObject <ERNAction>
+(instancetype)actionWithActionsForHosts:(NSDictionary *)actions;
+(instancetype)actionWithActionsForSchemes:(NSDictionary *)actions;
@end
