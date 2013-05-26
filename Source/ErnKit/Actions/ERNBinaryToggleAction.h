#import <Foundation/Foundation.h>
#import "ERNBinaryToggle.h"
#import "ERNAction.h"

@interface ERNBinaryToggleAction : NSObject <ERNAction, ERNBinaryToggle>
+(instancetype)createWithAction:(id<ERNAction>)action;
@end
