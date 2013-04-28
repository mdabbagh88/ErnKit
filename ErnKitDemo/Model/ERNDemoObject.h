#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ERNDemoObject : NSObject <MKAnnotation>
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *info;
@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly, assign) BOOL doubleHeight;
+(instancetype)objectWithTitle:(NSString *)title
                          info:(NSString *)info
                           url:(NSURL *)url
                    coordinate:(CLLocationCoordinate2D)coordinate;

+(instancetype)doubleHeightObjectWithTitle:(NSString *)title
                                      info:(NSString *)info
                                       url:(NSURL *)url
                                coordinate:(CLLocationCoordinate2D)coordinate;
@end
