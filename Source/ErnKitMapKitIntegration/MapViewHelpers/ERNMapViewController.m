#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ERNMapViewController.h"
#import "ERNNullMapViewDelegate.h"
#import "ERNErrorHandler.h"

@interface ERNMapViewController ()
@property (nonatomic, readonly) id<MKMapViewDelegate> delegate;
@end

@implementation ERNMapViewController {
    id<MKMapViewDelegate> _delegate;
    MKMapView *_mapView;
}

#pragma mark - public - constructors

+(instancetype)createWithMapViewDelegate:(id<MKMapViewDelegate>)mapViewDelegate
{
    return [[self alloc] initWithMapViewDelegate:mapViewDelegate];
}

#pragma mark - UIViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setupMapView];
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

#pragma mark - private - accessors

-(id<MKMapViewDelegate>)delegate
{
    return _delegate = _delegate ? _delegate : [ERNNullMapViewDelegate create];
}

-(MKMapView *)mapView
{
    return _mapView = _mapView ? _mapView : [MKMapView new];
}

#pragma mark - private - initializers

-(id)initWithMapViewDelegate:(id<MKMapViewDelegate>)mapViewDelegate
{
    self = [super init];
    ERNCheckNil(self);
    _delegate = mapViewDelegate;
    return self;
}

@end
