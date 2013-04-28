#import <MapKit/MapKit.h>

@interface MKAnnotationView (ERNHelper)
+(instancetype)viewForMapView:(MKMapView *)mapView
                   annotation:(id<MKAnnotation>)annotation
                   identifier:(NSString *)identifier;
@end
