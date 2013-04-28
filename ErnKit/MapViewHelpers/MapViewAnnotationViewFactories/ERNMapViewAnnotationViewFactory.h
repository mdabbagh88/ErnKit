#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@protocol ERNMapViewAnnotationViewFactory <NSObject>
-(MKAnnotationView *)annotationViewForMapView:(MKMapView *)mapView
                               fromAnnotation:(id<MKAnnotation>)annotation;
@end
