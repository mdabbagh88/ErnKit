#import <Foundation/Foundation.h>
#import "ERNMapViewAnnotationViewFactory.h"

@interface ERNRoutingMapViewAnnotationViewFactory : NSObject <ERNMapViewAnnotationViewFactory>
+(instancetype)factory;
+(instancetype)createWithMappings:(NSDictionary *)mappings;
+(instancetype)createWithMappings:(NSDictionary *)mappings
                   defaultFactory:(id<ERNMapViewAnnotationViewFactory>)defaultFactory;
@end
