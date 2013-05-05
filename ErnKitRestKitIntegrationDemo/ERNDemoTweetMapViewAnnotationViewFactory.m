#import "ERNDemoTweetMapViewAnnotationViewFactory.h"
#import "ERNDemoTweet.h"
#import "MKAnnotationView+ERNHelper.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

// An ERNMapViewAnnotationViewFactory, creating MKAnnotationViews based on ERNDemoTweet objects
@implementation ERNDemoTweetMapViewAnnotationViewFactory {
}

#pragma mark - public - constructors

+(instancetype)annotationViewFactory
{
    return [[self alloc] init];
}

#pragma mark - ERNMapViewAnnotationViewFactory

-(MKAnnotationView *)annotationViewForMapView:(MKMapView *)mapView
                               fromAnnotation:(ERNDemoTweet *)annotation
{
    // Setup the size for the image on the map
    CGRect bounds = CGRectMake(0, 0, 50, 50);

    // Setup the reuse identifier
    NSString *identifier = NSStringFromClass([annotation class]);

    // Setup an image view, using the image url from the ERNDemoTweet class
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:bounds];
    [imageView setImageWithURL:[annotation imageUrl]];

    // Setup and annotation view, reusing current annotations from the map if possible
    MKAnnotationView *annotationView = [MKAnnotationView viewForMapView:mapView
                                                             annotation:annotation
                                                             identifier:identifier];

    // Customize the annotation view and add the image view as a subview
    [annotationView setCanShowCallout:YES];
    [annotationView addSubview:imageView];
    [annotationView setBounds:bounds];

    // Return the annotation view with the added image to the system to be shown on the map
    return annotationView;
}

@end
