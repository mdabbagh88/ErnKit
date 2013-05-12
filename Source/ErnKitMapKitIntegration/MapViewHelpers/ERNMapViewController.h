#import <UIKit/UIKit.h>

@protocol ERNAsyncItemsRepository;
@protocol ERNActionHandler;
@protocol ERNMapViewAnnotationViewFactory;
@class MKMapView;

@interface ERNMapViewController : UIViewController
@property (nonatomic, readonly) MKMapView *mapView;
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                      actionHandler:(id<ERNActionHandler>)actionHandler
                        viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory;
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository;
+(instancetype)createAutoZoomingWithRepository:(id<ERNAsyncItemsRepository>)repository
                                 actionHandler:(id<ERNActionHandler>)actionHandler
                                   viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory;
+(instancetype)createAutoZoomingWithRepository:(id<ERNAsyncItemsRepository>)repository;
@end
