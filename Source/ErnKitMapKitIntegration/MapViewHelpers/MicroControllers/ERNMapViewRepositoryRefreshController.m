#import <MapKit/MapKit.h>
#import "ERNMapViewRepositoryRefreshController.h"
#import "ERNAsyncItemsRepository.h"
#import "MKMapView+ERNHelper.h"
#import "ERNErrorHandler.h"

typedef const void(^ERNAnnotationZoomer)();

@interface ERNMapViewRepositoryRefreshController ()
@property (nonatomic, readonly) MKMapView *mapView;
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> repository;
@property (nonatomic, readonly, copy) ERNAnnotationZoomer annotationZoomer;
@end

@implementation ERNMapViewRepositoryRefreshController {
}

#pragma mark - public - constructors

+(instancetype)createAutoZoomingWithMapView:(MKMapView *)mapView
                                 repository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithMapView:mapView
                              repository:repository
                        annotationZoomer:^(){
                            [mapView ERN_zoomToFitMapAnnotations];
                        }];
}

+(instancetype)createWithMapView:(MKMapView *)mapView
                      repository:(id<ERNAsyncItemsRepository>)repository
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
    return [[self repository] filteredArrayUsingPredicate:annotationFilterPredicate()];
}

static NSPredicate *annotationFilterPredicate(void)
{
    return [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, __unused NSDictionary *bindings) {
        return [evaluatedObject conformsToProtocol:@protocol(MKAnnotation)];
    }];
}

#pragma mark - private - initializers

-(id)initWithMapView:(MKMapView *)mapView
          repository:(id<ERNAsyncItemsRepository>)repository
    annotationZoomer:(ERNAnnotationZoomer)annotationZoomer
{
    self = [super init];
    ERNCheckNil(self);
    _repository = repository;
    _mapView = mapView;
    _annotationZoomer = annotationZoomer;
    [repository addObserver:self
                   selector:@selector(reload)];
    return self;
}

@end
