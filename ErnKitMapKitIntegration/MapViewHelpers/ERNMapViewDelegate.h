#import <MapKit/MapKit.h>

@protocol ERNActionHandler;
@protocol ERNMapViewAnnotationViewFactory;

@interface ERNMapViewDelegate : NSObject <MKMapViewDelegate>
+(instancetype)createWithActionHandler:(id<ERNActionHandler>)actionHandler
                           viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory;
@end
