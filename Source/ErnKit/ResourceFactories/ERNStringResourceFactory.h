#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNStringResourceFactory : NSObject <ERNResourceFactory>
+(NSString *)mime;
+(NSString *)scheme;
+(instancetype)create;
@end
