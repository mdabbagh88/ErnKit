#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ERNMapViewController.h"
#import "ERNMapViewDelegate.h"
#import "ERNNullMapViewDelegate.h"
#import "ERNAsyncItemsRepositoryMapViewManager.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNErrorHandler.h"

typedef id<MKMapViewDelegate> (^ERNMapViewDelegateConstructor)();
typedef id<ERNMapViewManager> (^ERNMapViewManagerConstructor)(MKMapView *);

static id<ERNAsyncItemsRepository> validateRepository(id<ERNAsyncItemsRepository>repository);

@interface ERNMapViewController ()
@property (nonatomic, readonly) id<MKMapViewDelegate> delegate;
@property (nonatomic, readonly) id<ERNMapViewManager> mapViewManager;
@property (nonatomic, readonly) id<ERNAsyncRepository> repository;
@property (nonatomic, readonly, copy) ERNMapViewDelegateConstructor createDelegate;
@property (nonatomic, readonly, copy) ERNMapViewManagerConstructor createMapViewManager;
@end

@implementation ERNMapViewController {
    id<ERNMapViewManager> _mapViewManager;
    id<MKMapViewDelegate> _delegate;
    MKMapView *_mapView;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                      actionHandler:(id<ERNActionHandler>)actionHandler
                        viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    return [[self alloc] initWithRepository:repository
                        delegateConstructor:^(){
                            return [ERNMapViewDelegate createWithActionHandler:actionHandler
                                                                   viewFactory:viewFactory];
                        }
                  mapViewManagerConstructor:^(MKMapView *mapView) {
                      return [ERNAsyncItemsRepositoryMapViewManager
                              createWithRepository:validateRepository(repository)
                              mapView:mapView];
                  }];
}


+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithRepository:repository
                        delegateConstructor:^(){
                            return [ERNNullMapViewDelegate create];
                        }
                  mapViewManagerConstructor:^(MKMapView *mapView) {
                      return [ERNAsyncItemsRepositoryMapViewManager
                              createWithRepository:validateRepository(repository)
                              mapView:mapView];
                  }];
}

+(instancetype)createAutoZoomingWithRepository:(id<ERNAsyncItemsRepository>)repository
                                 actionHandler:(id<ERNActionHandler>)actionHandler
                                   viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    return [[self alloc] initWithRepository:repository
                        delegateConstructor:^(){
                            return [ERNMapViewDelegate createWithActionHandler:actionHandler
                                                                   viewFactory:viewFactory];
                        }
                  mapViewManagerConstructor:^(MKMapView *mapView) {
                      return [ERNAsyncItemsRepositoryMapViewManager
                              createAutoZoomingWithRepository:validateRepository(repository)
                              mapView:mapView];
                  }];
}


+(instancetype)createAutoZoomingWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithRepository:repository
                        delegateConstructor:^(){
                            return [ERNNullMapViewDelegate create];
                        }
                  mapViewManagerConstructor:^(MKMapView *mapView) {
                      return [ERNAsyncItemsRepositoryMapViewManager
                              createAutoZoomingWithRepository:validateRepository(repository)
                              mapView:mapView];
                  }];
}

#pragma mark - UIViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setupMapView];
    [[self mapViewManager] reload];
}

-(void)setupMapView
{
    [[self mapView] setDelegate:[self delegate]];
    [[self mapView] setFrame:[[self view] bounds]];
    [[self mapView] setAutoresizingMask:
     UIViewAutoresizingFlexibleWidth |
     UIViewAutoresizingFlexibleHeight];
    [[self view] addSubview:[self mapView]];
}

#pragma mark - private

static id<ERNAsyncItemsRepository> validateRepository(id<ERNAsyncItemsRepository>repository)
{
    return repository ? repository : [ERNNullAsyncItemsRepository create];
}

#pragma mark - private - accessors

-(id<ERNMapViewManager>)mapViewManager
{
    return _mapViewManager = _mapViewManager ?
    _mapViewManager :
    [self createMapViewManager]([self mapView]);
}

-(id<MKMapViewDelegate>)delegate
{
    return _delegate = _delegate ? _delegate : [self createDelegate]();
}

-(MKMapView *)mapView
{
    return _mapView = _mapView ? _mapView : [MKMapView new];
}

#pragma mark - private - initializers

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
    delegateConstructor:(ERNMapViewDelegateConstructor)delegateConstructor
mapViewManagerConstructor:(ERNMapViewManagerConstructor)mapViewManagerConstructor

{
    self = [self init];
    ERNCheckNil(self);
    _repository = validateRepository(repository);
    _createDelegate = delegateConstructor;
    _createMapViewManager = mapViewManagerConstructor;
    return self;
}

@end
