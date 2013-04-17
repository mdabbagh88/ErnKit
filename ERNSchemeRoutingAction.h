#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNSchemeRoutingAction : NSObject <ERNAction>
+(instancetype)actionWithActionsForSchemes:(NSDictionary *)actions;
@end
