#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ERNMapViewController.h"
#import "ERNMapViewDelegate.h"
#import "ERNAsyncItemsRepositoryMapViewManager.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNErrorHandler.h"

static id<ERNAsyncItemsRepository> validateRepository(id<ERNAsyncItemsRepository>repository);

@interface ERNMapViewController ()
@property (nonatomic, readonly) id<MKMapViewDelegate> delegate;
@property (nonatomic, readonly) id<ERNMapViewManager> mapViewManager;
@property (nonatomic, readonly) id<ERNAsyncRepository> repository;
@property (nonatomic, readonly, copy) id<MKMapViewDelegate> (^createDelegate)();
@property (nonatomic, readonly, copy) id<ERNMapViewManager> (^createMapViewManager)(MKMapView *);
@end

@implementation ERNMapViewController {
    id<ERNMapViewManager> _mapViewManager;
    id<MKMapViewDelegate> _delegate;
    MKMapView *_mapView;
}

#pragma mark - public - constructors

+(instancetype)viewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository
                              actionHandler:(id<ERNActionHandler>)actionHandler
                                viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    return [[self alloc] initWithRepository:repository
                              actionHandler:actionHandler
                                viewFactory:viewFactory];
}


+(instancetype)viewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithRepository:repository];
}

+(instancetype)autoZoomingViewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                         actionHandler:(id<ERNActionHandler>)actionHandler
                                           viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    return [[self alloc] initAutoZoomingWithRepository:repository
                                         actionHandler:actionHandler
                                           viewFactory:viewFactory];
}


+(instancetype)autoZoomingViewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initAutoZoomingWithRepository:repository];
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
    return repository ? repository : [ERNNullAsyncItemsRepository repository];
}

-(void)setupZoomingMapViewManagerConstructor:(id<ERNAsyncItemsRepository>)repository
{
    _createMapViewManager = ^(MKMapView *mapView) {
        return [ERNAsyncItemsRepositoryMapViewManager
                autoZoomingMapViewManagerWithRepository:validateRepository(repository)
                mapView:mapView];
    };
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

-(id)initAutoZoomingWithRepository:(id<ERNAsyncItemsRepository>)repository
                     actionHandler:(id<ERNActionHandler>)actionHandler
                       viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    self = [self initWithRepository:repository
                      actionHandler:actionHandler
                        viewFactory:viewFactory];
    ERNCheckNil(self);
    [self setupZoomingMapViewManagerConstructor:repository];
    return self;
}

-(id)initAutoZoomingWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    self = [self initWithRepository:repository];
    ERNCheckNil(self);
    [self setupZoomingMapViewManagerConstructor:repository];
    return self;
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
          actionHandler:(id<ERNActionHandler>)actionHandler
            viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    self = [self initWithRepository:repository];
    ERNCheckNil(self);
    _createDelegate = ^(){
        return [ERNMapViewDelegate delegateWithActionHandler:actionHandler
                                                 viewFactory:viewFactory];
    };
    return self;
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    self = [self init];
    ERNCheckNil(self);
    _repository = validateRepository(repository);
    _createDelegate = ^(){
        return [ERNMapViewDelegate delegate];
    };
    _createMapViewManager = ^(MKMapView *mapView) {
        return [ERNAsyncItemsRepositoryMapViewManager
                mapViewManagerWithRepository:validateRepository(repository)
                mapView:mapView];
    };
    return self;
}

@end
