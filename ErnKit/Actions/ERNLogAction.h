#import <Foundation/Foundation.h>
#import "ERNAction.h"

@interface ERNLogAction : NSObject <ERNAction>
+(instancetype)createWithLogString:(NSString *)string;
@end
