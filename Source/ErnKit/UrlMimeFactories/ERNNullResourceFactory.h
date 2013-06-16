#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNNullResourceFactory : NSObject <ERNResourceFactory>
+(instancetype)create;
@end
