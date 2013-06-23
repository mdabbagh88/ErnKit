#import <Foundation/Foundation.h>
#import "ERNBinaryToggle.h"
#import "ERNAction.h"
#import "ERNBaseObservable.h"

@interface ERNBinaryToggleAction : ERNBaseObservable <ERNAction, ERNBinaryToggle>
+(instancetype)createWithAction:(id<ERNAction>)action;
@end
