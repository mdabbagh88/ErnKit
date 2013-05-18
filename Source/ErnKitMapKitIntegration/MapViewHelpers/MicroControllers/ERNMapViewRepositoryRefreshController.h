#import <Foundation/Foundation.h>

@protocol ERNAsyncItemsRepository;
@class MKMapView;

@interface ERNMapViewRepositoryRefreshController : NSObject
+(instancetype)createAutoZoomingWithMapView:(MKMapView *)mapView
                                 repository:(id<ERNAsyncItemsRepository>)repository;
+(instancetype)createWithMapView:(MKMapView *)mapView
                      repository:(id<ERNAsyncItemsRepository>)repository;
@end
