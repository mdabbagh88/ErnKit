#import <Foundation/Foundation.h>
#import "ERNUrlMimeFactory.h"

@interface ERNURLUrlMimeFactory : NSObject <ERNUrlMimeFactory>
+(NSString *)mime;
+(instancetype)create;
@end
