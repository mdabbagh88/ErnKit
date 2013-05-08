#import <Foundation/Foundation.h>
#import "ERNUrlMimeFactory.h"

@interface ERNRoutingUrlMimeFactory : NSObject <ERNUrlMimeFactory>
+(instancetype)createWithMappings:(NSDictionary *)mappings;
@end
