#import <Foundation/Foundation.h>

@class MKMapView;
@class MKAnnotationView;
@protocol MKAnnotation;

@protocol ERNMapViewAnnotationViewFactory <NSObject>
-(MKAnnotationView *)annotationViewWithViewReuser:(MKAnnotationView *(^)(NSString *identifier))block
                                   fromAnnotation:(id<MKAnnotation>)annotation;
@end
