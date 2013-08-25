#import <Foundation/Foundation.h>
#import "ERNObjectAction.h"

@interface ERNDualObjectAction : NSObject <ERNObjectAction>
+(instancetype)createWithFirstObjectAction:(id<ERNObjectAction>)firstObjectAction
                        secondObjectAction:(id<ERNObjectAction>)secondObjectAction;
@end
