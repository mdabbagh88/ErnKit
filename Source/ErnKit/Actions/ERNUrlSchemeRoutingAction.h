#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNUrlSchemeRoutingAction : NSObject <ERNAction>
+(instancetype)createWithActions:(NSDictionary *)actions;
@end
