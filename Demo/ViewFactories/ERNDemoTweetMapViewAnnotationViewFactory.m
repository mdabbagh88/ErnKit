#import "ERNDemoTweetMapViewAnnotationViewFactory.h"
#import "MKAnnotationView+ERNDemoTwitter.h"

// An ERNMapViewAnnotationViewFactory, creating MKAnnotationViews based on ERNDemoTweet objects

@implementation ERNDemoTweetMapViewAnnotationViewFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNMapViewAnnotationViewFactory

-(MKAnnotationView *)annotationViewForMapView:(MKMapView *)mapView
                               fromAnnotation:(id<MKAnnotation>)annotation
{
    return [MKAnnotationView createTwitterForMapView:mapView
                                      fromAnnotation:(ERNDemoTweet *)annotation];
}

@end
