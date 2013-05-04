#import "ERNMapViewDelegate.h"
#import "ERNActionHandler.h"
#import "ERNMapViewAnnotationViewFactory.h"
#import "ERNErrorHandler.h"

@interface ERNMapViewDelegate ()
@property (nonatomic, readonly) id<ERNActionHandler> actionHandler;
@property (nonatomic, readonly) id<ERNMapViewAnnotationViewFactory> viewFactory;
@end

@implementation ERNMapViewDelegate {
}

#pragma mark - public - constructors

+(instancetype)delegate
{
    return [[self alloc] init];
}

+(instancetype)delegateWithActionHandler:(id<ERNActionHandler>)actionHandler
                             viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    return [[self alloc] initWithActionHandler:actionHandler
                                   viewFactory:viewFactory];
}

#pragma mark - MKMapViewDelegate

-(void)mapView:(MKMapView *)mapView
didSelectAnnotationView:(MKAnnotationView *)view
{
    [self didSelectAnnotation:[view annotation]];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView
           viewForAnnotation:(id<MKAnnotation>)annotation
{
    ERNCheckNil(mapView);
    ERNCheckNil(annotation);
    return [[self viewFactory] annotationViewForMapView:mapView
                                         fromAnnotation:annotation];
}

#pragma mark - private

-(void)didSelectAnnotation:(id<MKAnnotation>)annotation
{
    ERNCheckNilNoReturn(annotation);
    [[self actionHandler] actionForObject:annotation];
}

#pragma mark - private - initializers

-(id)initWithActionHandler:(id<ERNActionHandler>)actionHandler
               viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    self = [self init];
    ERNCheckNil(self);
    _actionHandler = actionHandler;
    _viewFactory = viewFactory;
    return self;
}

@end
