#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ERNDemoObject2 : NSObject <MKAnnotation>
+(instancetype)objectWithTitle:(NSString *)title
                    coordinate:(CLLocationCoordinate2D)coordinate;
@end
