#import <Foundation/Foundation.h>
#import "ERNUrlMimeFactory.h"

@interface ERNNumberUrlMimeFactory : NSObject <ERNUrlMimeFactory>
+(NSString *)mime;
+(instancetype)create;
@end
