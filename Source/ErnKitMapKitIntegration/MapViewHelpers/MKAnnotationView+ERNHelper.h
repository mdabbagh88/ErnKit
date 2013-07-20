#import <MapKit/MapKit.h>

@interface MKAnnotationView (ERNHelper)
+(instancetype)ERN_createWithViewReuser:(MKAnnotationView *(^)(NSString *))block
                             annotation:(id<MKAnnotation>)annotation;
@end
