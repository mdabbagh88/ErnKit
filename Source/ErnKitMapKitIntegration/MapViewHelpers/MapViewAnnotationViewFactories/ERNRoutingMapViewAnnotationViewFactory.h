#import <Foundation/Foundation.h>
#import "ERNMapViewAnnotationViewFactory.h"

@interface ERNRoutingMapViewAnnotationViewFactory : NSObject <ERNMapViewAnnotationViewFactory>
+(instancetype)createWithMappings:(NSDictionary *)mappings;
@end
