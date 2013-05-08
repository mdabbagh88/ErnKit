#import <Foundation/Foundation.h>
#import "ERNMapViewManager.h"

@protocol ERNAsyncItemsRepository;
@class MKMapView;

@interface ERNAsyncItemsRepositoryMapViewManager : NSObject <ERNMapViewManager>
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                            mapView:(MKMapView *)mapView;
+(instancetype)createAutoZoomingWithRepository:(id<ERNAsyncItemsRepository>)repository
                                       mapView:(MKMapView *)mapView;
@end
