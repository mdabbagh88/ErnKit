#import "ERNRoutingMapViewAnnotationViewFactory.h"
#import "NSObject+ERNHelper.h"

@interface ERNRoutingMapViewAnnotationViewFactory ()
@property (nonatomic, readonly) id<ERNMapViewAnnotationViewFactory> defaultFactory;
@property (nonatomic, readonly, copy) NSDictionary *mappings;
@end

@implementation ERNRoutingMapViewAnnotationViewFactory

@synthesize mappings = _mappings;

-(MKAnnotationView *)annotationViewForMapView:(MKMapView *)mapView
                               fromAnnotation:(id<MKAnnotation>)annotation
{
    ERNCheckNil(mapView);
    ERNCheckNil(annotation);
    return [[self factoryForAnnotation:annotation] annotationViewForMapView:mapView
                                                             fromAnnotation:annotation];
}

-(id<ERNMapViewAnnotationViewFactory>)factoryForAnnotation:(id<MKAnnotation>)annotation
{
    return [self validFactory:[self mappings][NSStringFromClass([annotation class])]];
}

-(id<ERNMapViewAnnotationViewFactory>)validFactory:(id<ERNMapViewAnnotationViewFactory>)factory
{
    return [self factoryIsValid:factory] ? factory : [self defaultFactory];
}

-(BOOL)factoryIsValid:(id<ERNMapViewAnnotationViewFactory>)factory
{
    return [factory conformsToProtocol:@protocol(ERNMapViewAnnotationViewFactory)];
}

-(NSDictionary *)mappings
{
    _mappings = _mappings ? _mappings : @{};
    return _mappings;
}

-(id)initWithMappings:(NSDictionary *)mappings
       defaultFactory:(id<ERNMapViewAnnotationViewFactory>)defaultFactory
{
    self = [self initWithMappings:mappings];
    ERNCheckNil(self);
    _defaultFactory = defaultFactory;
    return self;
}

-(id)initWithMappings:(NSDictionary *)mappings
{
    self = [self init];
    ERNCheckNil(self);
    _mappings = mappings;
    return self;
}

+(instancetype)factory
{
    return [[self alloc] init];
}

+(instancetype)factoryWithMappings:(NSDictionary *)mappings
{
    return [[self alloc] initWithMappings:mappings];
}

+(instancetype)factoryWithMappings:(NSDictionary *)mappings
                    defaultFactory:(id<ERNMapViewAnnotationViewFactory>)defaultFactory
{
    return [[self alloc] initWithMappings:mappings
                           defaultFactory:defaultFactory];
}

@end
