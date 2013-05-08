#import "ERNDemoObjectMapViewAnnotationViewFactory.h"
#import "MKAnnotationView+ERNHelper.h"
#import "ERNDemoObject.h"

@implementation ERNDemoObjectMapViewAnnotationViewFactory

-(MKAnnotationView *)annotationViewForMapView:(MKMapView *)mapView
                               fromAnnotation:(ERNDemoObject *)annotation
{
    return [self setupView:[MKAnnotationView createForMapView:mapView
                                                   annotation:annotation
                                                   identifier:NSStringFromClass([annotation class])]];
}

-(MKAnnotationView *)setupView:(MKAnnotationView *)view
{
    [view setImage:[self createImage]];
    [view setCanShowCallout:YES];
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

+(instancetype)annotationViewFactory
{
    return [self new];
}

@end
