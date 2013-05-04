#import <Foundation/Foundation.h>
#import "ERNMapViewManager.h"

@protocol ERNAsyncItemsRepository;
@class MKMapView;

@interface ERNAsyncItemsRepositoryMapViewManager : NSObject <ERNMapViewManager>
+(instancetype)mapViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                    mapView:(MKMapView *)mapView;
+(instancetype)autoZoomingMapViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                               mapView:(MKMapView *)mapView;
@end
