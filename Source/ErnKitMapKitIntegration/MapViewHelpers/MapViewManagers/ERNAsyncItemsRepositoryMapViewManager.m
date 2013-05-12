#import <MapKit/MapKit.h>
#import "ERNAsyncItemsRepositoryMapViewManager.h"
#import "ERNAsyncItemsRepository.h"
#import "MKMapView+ERNHelper.h"
#import "ERNErrorHandler.h"

@interface ERNAsyncItemsRepositoryMapViewManager ()
@property (nonatomic, readonly) MKMapView *mapView;
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> repository;
@property (nonatomic, readonly, copy) const void(^annotationZoomer)();
@end

@implementation ERNAsyncItemsRepositoryMapViewManager {
}

#pragma mark - public - constructors

+(instancetype)createAutoZoomingWithRepository:(id<ERNAsyncItemsRepository>)repository
                                       mapView:(MKMapView *)mapView
{
    return [[self alloc] initAutoZoomingWithRepository:repository
                                               mapView:mapView];
}

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                            mapView:(MKMapView *)mapView
{
    return [[self alloc] initWithRepository:repository
                                    mapView:mapView];
}

#pragma mark - ERNMapViewManager

-(void)reload
{
    [self reloadWithAnnotations:[self annotationsInRepository]];
}

#pragma mark - NSObject

-(void)dealloc
{
    [_repository removeObserver:self];
}

#pragma mark - private

-(void)reloadWithAnnotations:(NSArray *)annotations
{
    [[self mapView] removeAnnotations:[[self mapView] annotations]];
    ERNCheckNilNoReturn(annotations);
    [[self mapView] addAnnotations:annotations];
    [self annotationZoomer]([self mapView]);
}

-(NSArray *)annotationsInRepository
{
    return [[self repository] filteredArrayUsingPredicate:[self annotationFilterPredicate]];
}

-(NSPredicate *)annotationFilterPredicate
{
    return [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return [evaluatedObject conformsToProtocol:@protocol(MKAnnotation)];
    }];
}

#pragma mark - private - initializers

-(id)initAutoZoomingWithRepository:(id<ERNAsyncItemsRepository>)repository
                           mapView:(MKMapView *)mapView
{
    self = [self initWithRepository:repository
                            mapView:mapView];
    ERNCheckNil(self);
    _annotationZoomer = ^(){
        [mapView ERN_zoomToFitMapAnnotations];
    };
    return self;
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

@end
