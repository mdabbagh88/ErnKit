#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNDualAction : NSObject <ERNAction>
+(instancetype)createWithFirstAction:(id<ERNAction>)firstAction
                        secondAction:(id<ERNAction>)secondAction;
@end
