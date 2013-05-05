#import "ERNViewController.h"

@protocol ERNAsyncItemsRepository;
@protocol ERNActionHandler;
@protocol ERNMapViewAnnotationViewFactory;
@class MKMapView;

@interface ERNMapViewController : ERNViewController
@property (nonatomic, readonly) MKMapView *mapView;
+(instancetype)viewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository
                              actionHandler:(id<ERNActionHandler>)actionHandler
                                viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory;
+(instancetype)viewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository;
+(instancetype)autoZoomingViewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                         actionHandler:(id<ERNActionHandler>)actionHandler
                                           viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory;
+(instancetype)autoZoomingViewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository;
@end
