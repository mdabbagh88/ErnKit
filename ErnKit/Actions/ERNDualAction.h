#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNDualAction : NSObject <ERNAction>
+(instancetype)actionWithFirstAction:(id<ERNAction>)firstAction
                        secondAction:(id<ERNAction>)secondAction;
@end
