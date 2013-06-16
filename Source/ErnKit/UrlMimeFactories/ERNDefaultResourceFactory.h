#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNDefaultResourceFactory : NSObject <ERNResourceFactory>
+(instancetype)create;
@end
