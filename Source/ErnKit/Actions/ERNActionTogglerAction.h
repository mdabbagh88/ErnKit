#import <Foundation/Foundation.h>
#import "ERNToggler.h"
#import "ERNAction.h"
#import "ERNBaseObservable.h"

@interface ERNActionTogglerAction : ERNBaseObservable <ERNToggler, ERNAction>
+(instancetype)createWithActions:(NSArray *)actions;
@end
