#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNURLResourceFactory : NSObject <ERNResourceFactory>
+(NSString *)mime;
+(instancetype)create;
@end
