#import <MapKit/MapKit.h>

@class ERNDemoTweet;

@interface MKAnnotationView (ERNDemoTwitter)
+(instancetype)createTwitterForMapView:(MKMapView *)mapView
                        fromAnnotation:(ERNDemoTweet *)annotation;
@end
