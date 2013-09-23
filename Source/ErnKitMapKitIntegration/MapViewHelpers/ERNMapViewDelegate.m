#import "ERNMapViewDelegate.h"
#import "ERNObjectAction.h"
#import "ERNMapViewAnnotationViewFactory.h"
#import "ERNNullObjectAction.h"
#import "ERNNullMapViewAnnotationViewFactory.h"
#import "ERNErrorHandler.h"

@interface ERNMapViewDelegate ()
@property (nonatomic, readonly) id<ERNObjectAction> objectAction;
@property (nonatomic, readonly) id<ERNMapViewAnnotationViewFactory> viewFactory;
@end

@implementation ERNMapViewDelegate {
    id<ERNObjectAction> _objectAction;
    id<ERNMapViewAnnotationViewFactory> _viewFactory;
}

#pragma mark - public - constructors

+(instancetype)createWithObjectAction:(id<ERNObjectAction>)objectAction
                          viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    return [[self alloc] initWithActionHandler:objectAction
                                   viewFactory:viewFactory];
}

#pragma mark - MKMapViewDelegate

-(void)mapView:(MKMapView *)__unused mapView
didSelectAnnotationView:(MKAnnotationView *)view
{
    [self didSelectAnnotation:[view annotation]];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView
           viewForAnnotation:(id<MKAnnotation>)annotation
{
    ERNCheckNil(mapView);
    ERNCheckNil(annotation);
    return [[self viewFactory] annotationViewWithViewReuser:
            ^MKAnnotationView *(NSString *identifier) {
                return [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
            }
                                             fromAnnotation:annotation];
}

#pragma mark - private

-(void)didSelectAnnotation:(id<MKAnnotation>)annotation
{
    ERNCheckNilNoReturn(annotation);
    [[self objectAction] actionForObject:annotation];
}

#pragma mark - private - accessors

ERNLazyLoadGetter(id<ERNObjectAction>, objectAction, [ERNNullObjectAction create])

ERNLazyLoadGetter(id<ERNMapViewAnnotationViewFactory>,
                  viewFactory, [ERNNullMapViewAnnotationViewFactory create])

#pragma mark - private - initializers

-(id)initWithActionHandler:(id<ERNObjectAction>)objectAction
               viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    self = [super init];
    ERNCheckNil(self);
    _objectAction = objectAction;
    _viewFactory = viewFactory;
    return self;
}

@end
