#import <MapKit/MapKit.h>
#import "ERNAsyncItemsRepositoryMapViewManager.h"
#import "ERNAsyncItemsRepository.h"
#import "MKMapView+ERNHelper.h"
#import "NSObject+ERNHelper.h"

@interface ERNAsyncItemsRepositoryMapViewManager ()
@property (nonatomic, readonly) MKMapView *mapView;
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> repository;
@property (nonatomic, readonly, copy) const void(^annotationZoomer)();
@end

@implementation ERNAsyncItemsRepositoryMapViewManager

-(void)reload
{
    [self reloadWithAnnotations:[self annotationsInRepository]];
}

-(void)reloadWithAnnotations:(NSArray *)annotations
{
    [[self mapView] removeAnnotations:[[self mapView] annotations]];
    ERNCheckNil(annotations);
    [[self mapView] addAnnotations:annotations];
    [self annotationZoomer]([self mapView]);
}

-(NSArray *)annotationsInRepository
{
    return [[self repository] filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return [evaluatedObject conformsToProtocol:@protocol(MKAnnotation)];
    }]];
}

-(void)dealloc
{
    [_repository removeObserver:self];
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
                mapView:(MKMapView *)mapView
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    _mapView = mapView;
    _annotationZoomer = ^(){};
    [repository addObserver:self
                   selector:@selector(reload)];
    return self;
}

-(id)initAutoZoomingWithRepository:(id<ERNAsyncItemsRepository>)repository
                           mapView:(MKMapView *)mapView
{
    self = [self initWithRepository:repository
                            mapView:mapView];
    ERNCheckNil(self);
    _annotationZoomer = ^(){
        [mapView zoomToFitMapAnnotations];
    };
    return self;
}

+(instancetype)autoZoomingMapViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                               mapView:(MKMapView *)mapView
{
    return [[self alloc] initAutoZoomingWithRepository:repository
                                               mapView:mapView];
}

+(instancetype)mapViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                    mapView:(MKMapView *)mapView
{
    return [[self alloc] initWithRepository:repository
                                    mapView:mapView];
}

@end
