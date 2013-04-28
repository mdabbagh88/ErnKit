#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNMimeRoutingAction : NSObject <ERNAction>
+(instancetype)actionWithActionsForMimes:(NSDictionary *)actions;
@end
