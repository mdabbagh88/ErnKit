#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNLogAction : NSObject <ERNAction>
+(instancetype)actionWithLogString:(NSString *)string;
@end
