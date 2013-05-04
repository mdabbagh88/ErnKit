#import <Foundation/Foundation.h>

@class MKMapView;
@class MKAnnotationView;
@protocol MKAnnotation;

@protocol ERNMapViewAnnotationViewFactory <NSObject>
-(MKAnnotationView *)annotationViewForMapView:(MKMapView *)mapView
                               fromAnnotation:(id<MKAnnotation>)annotation;
@end
