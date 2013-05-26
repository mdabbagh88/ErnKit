#import <ErnKit/MKAnnotationView+ERNHelper.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "MKAnnotationView+ERNDemoTwitter.h"
#import "ERNDemoTweet.h"

@implementation MKAnnotationView (ERNDemoTwitter)

+(instancetype)createTwitterForMapView:(MKMapView *)mapView
                        fromAnnotation:(ERNDemoTweet *)annotation
{
    // Setup and annotation view, reusing current annotations from the map if possible
    MKAnnotationView *annotationView = [self ERN_createForMapView:mapView
                                                       annotation:annotation];

    // Setup an image view, using the image url from the ERNDemoTweet class
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [imageView setImageWithURL:[annotation imageUrl]];

    // Customize the annotation view and add the image view as a subview
    [annotationView addSubview:imageView];
    [annotationView setBounds:[imageView frame]];
    [annotationView setCanShowCallout:YES];

    // Return the annotation view with the added image to the system to be shown on the map
    return annotationView;
}

@end
