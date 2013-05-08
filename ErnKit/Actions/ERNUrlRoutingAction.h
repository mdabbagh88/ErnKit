#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNUrlRoutingAction : NSObject <ERNAction>
+(instancetype)createWithActionsForHosts:(NSDictionary *)actions;
+(instancetype)actionWithActionsForSchemes:(NSDictionary *)actions;
@end
