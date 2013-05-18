#import <UIKit/UIKit.h>

@protocol MKMapViewDelegate;
@class MKMapView;

@interface ERNMapViewController : UIViewController
@property (nonatomic, readonly) MKMapView *mapView;
+(instancetype)createWithMapViewDelegate:(id<MKMapViewDelegate>)mapViewDelegate;
@end
