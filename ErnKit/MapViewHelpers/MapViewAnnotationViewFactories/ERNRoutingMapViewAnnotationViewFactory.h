#import <Foundation/Foundation.h>
#import "ERNMapViewAnnotationViewFactory.h"

@interface ERNRoutingMapViewAnnotationViewFactory : NSObject <ERNMapViewAnnotationViewFactory>
+(instancetype)factoryWithMappings:(NSDictionary *)mappings;
@end
