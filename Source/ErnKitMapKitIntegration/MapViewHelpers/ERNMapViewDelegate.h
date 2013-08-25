#import <MapKit/MapKit.h>

@protocol ERNObjectAction;
@protocol ERNMapViewAnnotationViewFactory;

@interface ERNMapViewDelegate : NSObject <MKMapViewDelegate>
+(instancetype)createWithObjectAction:(id<ERNObjectAction>)objectAction
                           viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory;
@end
