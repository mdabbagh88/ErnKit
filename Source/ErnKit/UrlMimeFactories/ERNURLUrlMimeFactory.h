#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNURLUrlMimeFactory : NSObject <ERNResourceFactory>
+(NSString *)mime;
+(instancetype)create;
@end
