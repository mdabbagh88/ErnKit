#import <Foundation/Foundation.h>
#import "ERNAction.h"

@class ERNResource;

typedef void (^ERNActionBlock)(ERNResource *resource);

@interface ERNBlockAction : NSObject <ERNAction>
+(instancetype)createWithBlock:(ERNActionBlock)block;
@end
