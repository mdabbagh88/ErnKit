#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNRoutingUrlMimeFactory : NSObject <ERNResourceFactory>
+(instancetype)createWithMappings:(NSDictionary *)mappings;
@end
