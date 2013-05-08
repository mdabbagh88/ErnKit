#import "ERNDemoTweetMapViewAnnotationViewFactory.h"
#import "ERNDemoTweet.h"
#import "MKAnnotationView+ERNHelper.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation ERNDemoTweetMapViewAnnotationViewFactory

-(MKAnnotationView *)annotationViewForMapView:(MKMapView *)mapView
                               fromAnnotation:(ERNDemoTweet *)annotation
{
    return [self setupView:[MKAnnotationView createForMapView:mapView
                                                   annotation:annotation
                                                   identifier:NSStringFromClass([annotation class])]
                annotation:annotation];
}

-(MKAnnotationView *)setupView:(MKAnnotationView *)view
                    annotation:(ERNDemoTweet *)annotation
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [imageView setImageWithURL:[annotation imageUrl]];
    [view setBounds:[imageView bounds]];
    [view setCanShowCallout:YES];
    [view addSubview:imageView];
    return view;
}

-(UIImage *)createImage
{
    UIGraphicsBeginImageContext(CGSizeMake(20, 20));
    [[UIColor redColor] setFill];
    UIRectFill(CGRectMake(0, 0, 20, 20));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(instancetype)create
{
    return [self new];
}

@end
