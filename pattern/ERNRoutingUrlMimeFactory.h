#import <Foundation/Foundation.h>
#import "ERNUrlMimeFactory.h"

@interface ERNRoutingUrlMimeFactory : NSObject <ERNUrlMimeFactory>
+(instancetype)urlMimeFactoryWithMappings:(NSDictionary *)mappings;
@end
