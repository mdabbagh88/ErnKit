#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNTraceAction : NSObject <ERNAction>
+(instancetype)actionWithAction:(id<ERNAction>)action;
@end
