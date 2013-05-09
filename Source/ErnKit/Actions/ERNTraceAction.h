#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNTraceAction : NSObject <ERNAction>
+(instancetype)createWithAction:(id<ERNAction>)action;
@end
