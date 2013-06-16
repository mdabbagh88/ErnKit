#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNStringUrlMimeFactory : NSObject <ERNResourceFactory>
+(NSString *)mime;
+(instancetype)create;
@end
