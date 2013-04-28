#import "MKAnnotationView+ERNHelper.h"

@implementation MKAnnotationView (ERNHelper)

+(instancetype)viewForMapView:(MKMapView *)mapView
                   annotation:(id<MKAnnotation>)annotation
                   identifier:(NSString *)identifier
{
    return [self createAnnotationView:[mapView dequeueReusableAnnotationViewWithIdentifier:identifier]
                           annotation:annotation
                           identifier:identifier];

}

+(instancetype)createAnnotationView:(MKAnnotationView *)view
                   annotation:(id<MKAnnotation>)annotation
                   identifier:(NSString *)identifier
{
    return view ? [view setupAnnotation:annotation] : [[self alloc] initWithAnnotation:annotation
                                                                       reuseIdentifier:identifier];
}

-(instancetype)setupAnnotation:(id<MKAnnotation>)annotation
{
    [self setAnnotation:annotation];
    return self;
}

@end
