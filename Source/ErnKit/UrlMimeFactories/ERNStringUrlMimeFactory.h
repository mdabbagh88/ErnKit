#import <Foundation/Foundation.h>
#import "ERNUrlMimeFactory.h"

@interface ERNStringUrlMimeFactory : NSObject <ERNUrlMimeFactory>
+(NSString *)mime;
+(instancetype)create;
@end
