#import <MapKit/MapKit.h>
#import "ERNRoutingMapViewAnnotationViewFactory.h"
#import "ERNErrorHandler.h"

@interface ERNRoutingMapViewAnnotationViewFactory ()
@property (nonatomic, readonly) id<ERNMapViewAnnotationViewFactory> defaultFactory;
@property (nonatomic, readonly, copy) NSDictionary *mappings;
@end

@implementation ERNRoutingMapViewAnnotationViewFactory {
    NSDictionary *_mappings;
}

#pragma mark - public - constructors

+(instancetype)createWithMappings:(NSDictionary *)mappings
                   defaultFactory:(id<ERNMapViewAnnotationViewFactory>)defaultFactory
{
    return [[self alloc] initWithMappings:mappings
                           defaultFactory:defaultFactory];
}

#pragma mark - ERNMapViewAnnotationViewFactory

-(MKAnnotationView *)annotationViewForMapView:(MKMapView *)mapView
                               fromAnnotation:(id<MKAnnotation>)annotation
{
    ERNCheckNil(mapView);
    ERNCheckNil(annotation);
    return [[self factoryForAnnotation:annotation] annotationViewForMapView:mapView
                                                             fromAnnotation:annotation];
}

#pragma mark - private

-(id<ERNMapViewAnnotationViewFactory>)factoryForAnnotation:(id<MKAnnotation>)annotation
{
    return [self validFactory:[self mappings][NSStringFromClass([annotation class])]];
}

-(id<ERNMapViewAnnotationViewFactory>)validFactory:(id<ERNMapViewAnnotationViewFactory>)factory
{
    return factoryIsValid(factory) ? factory : [self defaultFactory];
}

static BOOL factoryIsValid(id<ERNMapViewAnnotationViewFactory>factory)
{
    return [factory conformsToProtocol:@protocol(ERNMapViewAnnotationViewFactory)];
}

#pragma mark - private - accessors

-(NSDictionary *)mappings
{
    return _mappings = _mappings ? _mappings : @{};
}

#pragma mark - private - initializers

-(id)initWithMappings:(NSDictionary *)mappings
       defaultFactory:(id<ERNMapViewAnnotationViewFactory>)defaultFactory
{
    self = [super init];
    ERNCheckNil(self);
    _mappings = mappings;
    _defaultFactory = defaultFactory;
    return self;
}

@end
