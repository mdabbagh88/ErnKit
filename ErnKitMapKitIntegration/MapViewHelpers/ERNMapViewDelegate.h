#import <Mapkit/MapKit.h>

@protocol ERNActionHandler;
@protocol ERNMapViewAnnotationViewFactory;

@interface ERNMapViewDelegate : NSObject <MKMapViewDelegate>
+(instancetype)delegateWithActionHandler:(id<ERNActionHandler>)actionHandler
                             viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory;
+(instancetype)delegate;
@end
