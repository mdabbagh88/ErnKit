#import <MapKit/MapKit.h>
#import "ERNMapViewRepositoryRefreshController.h"
#import "ERNAsyncPaginatedItemsRepository.h"
#import "MKMapView+ERNHelper.h"
#import "ERNErrorHandler.h"

typedef const void(^ERNAnnotationZoomer)();

@interface ERNMapViewRepositoryRefreshController ()
@property (nonatomic, readonly) MKMapView *mapView;
@property (nonatomic, readonly) id<ERNAsyncPaginatedItemsRepository> repository;
@property (nonatomic, readonly, copy) ERNAnnotationZoomer annotationZoomer;
@end

@implementation ERNMapViewRepositoryRefreshController {
}

#pragma mark - public - constructors

+(instancetype)createAutoZoomingWithMapView:(MKMapView *)mapView
                                 repository:(id<ERNAsyncPaginatedItemsRepository>)repository
{
    return [[self alloc] initWithMapView:mapView
                              repository:repository
                        annotationZoomer:^(){
                            [mapView ERN_zoomToFitMapAnnotations];
                        }];
}

+(instancetype)createWithMapView:(MKMapView *)mapView
                      repository:(id<ERNAsyncPaginatedItemsRepository>)repository
{
    return [[self alloc] initWithMapView:mapView
                              repository:repository
                        annotationZoomer:^(){}];
}

#pragma mark - NSObject

-(void)dealloc
{
    [_repository removeObserver:self];
}

#pragma mark - private

-(void)reload
{
    [self reloadWithAnnotations:[self annotationsInRepository]];
}

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

-(id)initWithMapView:(MKMapView *)mapView
          repository:(id<ERNAsyncPaginatedItemsRepository>)repository
    annotationZoomer:(ERNAnnotationZoomer)annotationZoomer
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    _mapView = mapView;
    _annotationZoomer = annotationZoomer;
    [repository addObserver:self
                   selector:@selector(reload)];
    return self;
}

@end
