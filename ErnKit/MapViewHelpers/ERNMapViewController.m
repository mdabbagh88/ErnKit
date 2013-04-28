#import <MapKit/MapKit.h>
#import "ERNMapViewController.h"
#import "ERNMapViewDelegate.h"
#import "ERNAsyncItemsRepositoryMapViewManager.h"
#import "ERNAsyncItemsRepository.h"
#import "NSObject+ERNHelper.h"

@interface ERNMapViewController ()
@property (nonatomic, readonly) id<MKMapViewDelegate> delegate;
@property (nonatomic, readonly) id<ERNMapViewManager> mapViewManager;
@property (nonatomic, readonly, copy) id<MKMapViewDelegate> (^createDelegate)();
@property (nonatomic, readonly, copy) id<ERNMapViewManager> (^createMapViewManager)(MKMapView *);
@end

@implementation ERNMapViewController

@synthesize mapViewManager = _mapViewManager;
@synthesize delegate = _delegate;
@synthesize mapView = _mapView;

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
    [[self mapView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [[self view] addSubview:[self mapView]];
}

-(id<ERNMapViewManager>)mapViewManager
{
    _mapViewManager = _mapViewManager ? _mapViewManager : [self createMapViewManager]([self mapView]);
    return _mapViewManager;
}

-(id<MKMapViewDelegate>)delegate
{
    _delegate = _delegate ? _delegate : [self createDelegate]();
    return _delegate;
}

-(MKMapView *)mapView
{
    _mapView = _mapView ? _mapView : [self createMapView];
    return _mapView;
}

-(MKMapView *)createMapView
{
    return [[MKMapView alloc] init];
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    self = [self init];
    ERNCheckNil(self);
    _createDelegate = ^(){
        return [ERNMapViewDelegate delegate];
    };
    _createMapViewManager = ^(MKMapView *mapView) {
        return [ERNAsyncItemsRepositoryMapViewManager mapViewManagerWithRepository:repository
                                                                           mapView:mapView];
    };
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

-(void)setupZoomingMapViewManagerConstructor:(id<ERNAsyncItemsRepository>)repository
{
    _createMapViewManager = ^(MKMapView *mapView) {
        return [ERNAsyncItemsRepositoryMapViewManager autoZoomingMapViewManagerWithRepository:repository
                                                                                      mapView:mapView];
    };
}

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

@end
