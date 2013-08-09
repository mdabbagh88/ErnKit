#import <Foundation/Foundation.h>

@protocol MKMapViewDelegate;
@class MKMapView;
@class UIView;

@interface ERNMapViewMicroController : NSObject
@property (nonatomic, readonly) MKMapView *mapView;
+(instancetype)createWithMapViewDelegate:(id<MKMapViewDelegate>)mapViewDelegate
                               superView:(UIView *)superView;
@end
