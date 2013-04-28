#import "ERNMapViewDelegate.h"
#import "ERNActionHandler.h"
#import "ERNMapViewAnnotationViewFactory.h"
#import "NSObject+ERNHelper.h"

@interface ERNMapViewDelegate ()
@property (nonatomic, readonly) id<ERNActionHandler> actionHandler;
@property (nonatomic, readonly) id<ERNMapViewAnnotationViewFactory> viewFactory;
@end

@implementation ERNMapViewDelegate

-(void)mapView:(MKMapView *)mapView
didSelectAnnotationView:(MKAnnotationView *)view
{
    [[self actionHandler] actionForObject:[view annotation]];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView
           viewForAnnotation:(id<MKAnnotation>)annotation
{
    return [[self viewFactory] annotationViewForMapView:mapView
                                         fromAnnotation:annotation];
}

-(id)initWithActionHandler:(id<ERNActionHandler>)actionHandler
               viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    self = [self init];
    ERNCheckNil(self);
    _actionHandler = actionHandler;
    _viewFactory = viewFactory;
    return self;
}

+(instancetype)delegateWithActionHandler:(id<ERNActionHandler>)actionHandler
                             viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    return [[self alloc] initWithActionHandler:actionHandler
                                   viewFactory:viewFactory];
}

+(instancetype)delegate
{
    return [[self alloc] init];
}

@end
