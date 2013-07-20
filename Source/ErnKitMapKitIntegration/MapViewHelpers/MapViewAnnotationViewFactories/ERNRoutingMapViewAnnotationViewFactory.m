#import <MapKit/MapKit.h>
#import "ERNRoutingMapViewAnnotationViewFactory.h"
#import "ERNNullMapViewAnnotationViewFactory.h"
#import "ERNErrorHandler.h"

@interface ERNRoutingMapViewAnnotationViewFactory ()
@property (nonatomic, readonly, copy) NSDictionary *mappings;
@end

@implementation ERNRoutingMapViewAnnotationViewFactory {
    NSDictionary *_mappings;
}

#pragma mark - public - constructors

+(instancetype)createWithMappings:(NSDictionary *)mappings
{
    return [[self alloc] initWithMappings:mappings];
}

#pragma mark - ERNMapViewAnnotationViewFactory

-(MKAnnotationView *)annotationViewWithViewReuser:(MKAnnotationView *(^)(NSString *identifier))block
                                   fromAnnotation:(id<MKAnnotation>)annotation
{
    ERNCheckNilAndReturn(annotation, [MKPinAnnotationView new]);
    ERNCheckNilAndReturn(block, [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                                reuseIdentifier:@""]);
    return [[self factoryForAnnotation:annotation] annotationViewWithViewReuser:block
                                                                 fromAnnotation:annotation];
}

#pragma mark - private

-(id<ERNMapViewAnnotationViewFactory>)factoryForAnnotation:(id<MKAnnotation>)annotation
{
    return validFactory([self mappings][NSStringFromClass([annotation class])]);
}

static id<ERNMapViewAnnotationViewFactory> validFactory(id<ERNMapViewAnnotationViewFactory>factory)
{
    return factoryIsValid(factory) ? factory : [ERNNullMapViewAnnotationViewFactory create];
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
{
    self = [super init];
    ERNCheckNil(self);
    _mappings = mappings;
    return self;
}

@end
