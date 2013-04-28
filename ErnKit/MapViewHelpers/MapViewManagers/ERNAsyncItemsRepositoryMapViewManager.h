#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "ERNMapViewManager.h"

@protocol ERNAsyncItemsRepository;

@interface ERNAsyncItemsRepositoryMapViewManager : NSObject <ERNMapViewManager>
+(instancetype)mapViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                    mapView:(MKMapView *)mapView;
+(instancetype)autoZoomingMapViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                               mapView:(MKMapView *)mapView;
@end
