#import "ERNDemoTweetMapViewAnnotationViewFactory.h"
#import "ERNDemoTweet.h"
#import "MKAnnotationView+ERNHelper.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation ERNDemoTweetMapViewAnnotationViewFactory

-(MKAnnotationView *)annotationViewForMapView:(MKMapView *)mapView
                               fromAnnotation:(ERNDemoTweet *)annotation
{
    return [self setupView:[MKAnnotationView viewForMapView:mapView
                                                 annotation:annotation
                                                 identifier:NSStringFromClass([annotation class])]
                    bounds:CGRectMake(0, 0, 50, 50)
                annotation:annotation];
}

-(MKAnnotationView *)setupView:(MKAnnotationView *)view
                        bounds:(CGRect)bounds
                    annotation:(ERNDemoTweet *)annotation
{
    [view setCanShowCallout:YES];
    [view addSubview:[self setupImageView:[self createImageViewWithFrame:bounds]
                               annotation:annotation]];
    [view setBounds:bounds];
    return view;
}

-(UIImageView *)createImageViewWithFrame:(CGRect)frame
{
    return [[UIImageView alloc] initWithFrame:frame];
}

-(UIImageView *)setupImageView:(UIImageView *)imageView
                    annotation:(ERNDemoTweet *)annotation
{
    [imageView setImageWithURL:[annotation imageUrl]];
    return imageView;
}

+(instancetype)annotationViewFactory
{
    return [[self alloc] init];
}

@end
