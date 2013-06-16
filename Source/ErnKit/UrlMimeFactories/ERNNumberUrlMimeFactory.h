#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNNumberUrlMimeFactory : NSObject <ERNResourceFactory>
+(NSString *)mime;
+(instancetype)create;
@end
