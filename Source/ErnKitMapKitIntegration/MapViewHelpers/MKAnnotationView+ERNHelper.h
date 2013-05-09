#import <MapKit/MapKit.h>

@interface MKAnnotationView (ERNHelper)
+(instancetype)createForMapView:(MKMapView *)mapView
                     annotation:(id<MKAnnotation>)annotation
                     identifier:(NSString *)identifier;
@end
