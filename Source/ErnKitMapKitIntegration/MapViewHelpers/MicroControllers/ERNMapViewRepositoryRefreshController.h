#import <Foundation/Foundation.h>

@protocol ERNAsyncPaginatedItemsRepository;
@class MKMapView;

@interface ERNMapViewRepositoryRefreshController : NSObject
+(instancetype)createAutoZoomingWithMapView:(MKMapView *)mapView
                                 repository:(id<ERNAsyncPaginatedItemsRepository>)repository;
+(instancetype)createWithMapView:(MKMapView *)mapView
                      repository:(id<ERNAsyncPaginatedItemsRepository>)repository;
@end
