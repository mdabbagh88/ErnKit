#import <Foundation/Foundation.h>
#import "ERNUrlMimeFactory.h"

@interface ERNDemoObjectUrlMimeFactory : NSObject <ERNUrlMimeFactory>
+(NSString *)mime;
+(instancetype)urlMimeFactory;
@end
