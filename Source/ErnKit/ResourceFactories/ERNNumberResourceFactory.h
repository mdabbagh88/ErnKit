#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNNumberResourceFactory : NSObject <ERNResourceFactory>
+(NSString *)mime;
+(NSString *)scheme;
+(instancetype)create;
@end
