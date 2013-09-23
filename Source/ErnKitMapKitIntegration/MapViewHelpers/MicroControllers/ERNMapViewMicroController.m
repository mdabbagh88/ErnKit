#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ERNMapViewMicroController.h"
#import "ERNNullMapViewDelegate.h"
#import "ERNErrorHandler.h"

@interface ERNMapViewMicroController ()
@property (nonatomic, readonly) id<MKMapViewDelegate> delegate;
@end

@implementation ERNMapViewMicroController {
    id<MKMapViewDelegate> _delegate;
    MKMapView *_mapView;
}

#pragma mark - public - constructors

+(instancetype)createWithMapViewDelegate:(id<MKMapViewDelegate>)mapViewDelegate
                               superView:(UIView *)superView
{
    return [[self alloc] initWithMapViewDelegate:mapViewDelegate
                                       superView:superView];
}

#pragma mark - NSObject

-(void)dealloc
{
    [[self mapView] setDelegate:nil];
}

#pragma mark - private - accessors

ERNLazyLoadGetter(id<MKMapViewDelegate>, delegate, [ERNNullMapViewDelegate create])

#pragma mark - private - initializers

-(id)initWithMapViewDelegate:(id<MKMapViewDelegate>)mapViewDelegate
                   superView:(UIView *)superView
{
    self = [super init];
    ERNCheckNil(self);
    _delegate = mapViewDelegate;
    _mapView = [MKMapView new];
    [_mapView setDelegate:[self delegate]];
    [_mapView setFrame:[superView bounds]];
    [_mapView setAutoresizingMask:
     UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [superView addSubview:_mapView];
    return self;
}

@end
