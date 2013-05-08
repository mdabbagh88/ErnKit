#import <Foundation/Foundation.h>
#import "ERNToggler.h"
#import "ERNAction.h"

@interface ERNActionTogglerAction : NSObject <ERNToggler, ERNAction>
+(instancetype)createWithActions:(NSArray *)actions;
@end
