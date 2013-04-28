#import <Foundation/Foundation.h>
#import "ERNUrlMimeFactory.h"

@interface ERNDemoObject2UrlMimeFactory : NSObject <ERNUrlMimeFactory>
+(NSString *)mime;
+(instancetype)urlMimeFactory;
@end
