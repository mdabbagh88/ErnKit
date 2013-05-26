#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNUrlHostRoutingAction : NSObject <ERNAction>
+(instancetype)createWithActions:(NSDictionary *)actions;
@end
