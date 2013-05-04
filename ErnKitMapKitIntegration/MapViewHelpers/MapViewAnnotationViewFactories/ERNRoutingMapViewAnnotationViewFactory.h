#import <Foundation/Foundation.h>
#import "ERNMapViewAnnotationViewFactory.h"

@interface ERNRoutingMapViewAnnotationViewFactory : NSObject <ERNMapViewAnnotationViewFactory>
+(instancetype)factory;
+(instancetype)factoryWithMappings:(NSDictionary *)mappings;
+(instancetype)factoryWithMappings:(NSDictionary *)mappings
                    defaultFactory:(id<ERNMapViewAnnotationViewFactory>)defaultFactory;
@end
