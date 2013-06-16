#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNDefaultUrlMimeFactory : NSObject <ERNResourceFactory>
+(instancetype)create;
@end
