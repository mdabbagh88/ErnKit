#import "MKAnnotationView+ERNHelper.h"
#import "NSObject+ERNHelper.h"
#import "ERNNullAnnotation.h"

@implementation MKAnnotationView (ERNHelper)

#pragma mark - public - constructors

+(instancetype)viewForMapView:(MKMapView *)mapView
                   annotation:(id<MKAnnotation>)annotation
                   identifier:(NSString *)identifier
{
    return [self createAnnotationView:[mapView dequeueReusableAnnotationViewWithIdentifier:identifier]
                           annotation:[self validateAnnotation:annotation]
                           identifier:identifier];

}

#pragma mark - private

+(id<MKAnnotation>)validateAnnotation:(id<MKAnnotation>)annotation
{
    return annotation ? annotation : [ERNNullAnnotation annotation];
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
