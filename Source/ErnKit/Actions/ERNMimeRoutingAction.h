#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNMimeRoutingAction : NSObject <ERNAction>
+(instancetype)createWithActionsForMimes:(NSDictionary *)actions;
@end