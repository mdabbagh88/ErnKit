#import <MapKit/MapKit.h>

@interface MKAnnotationView (ERNHelper)
+(instancetype)ERN_createForMapView:(MKMapView *)mapView
                         annotation:(id<MKAnnotation>)annotation;
+(instancetype)ERN_createWithAnnotation:(id<MKAnnotation>)annotation;
@end
