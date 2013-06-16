#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNRoutingResourceFactory : NSObject <ERNResourceFactory>
+(instancetype)createWithMappings:(NSDictionary *)mappings;
@end
