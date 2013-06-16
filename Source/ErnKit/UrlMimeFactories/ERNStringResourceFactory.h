#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNStringResourceFactory : NSObject <ERNResourceFactory>
+(NSString *)mime;
+(instancetype)create;
@end
