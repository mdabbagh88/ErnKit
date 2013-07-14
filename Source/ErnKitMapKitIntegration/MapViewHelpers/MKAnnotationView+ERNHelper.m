#import "MKAnnotationView+ERNHelper.h"
#import "NSObject+ERNHelper.h"
#import "ERNNullAnnotation.h"

@implementation MKAnnotationView (ERNHelper)

#pragma mark - public - constructors

+(instancetype)ERN_createWithAnnotation:(id<MKAnnotation>)annotation
{
    return [self ERN_createForMapView:nil
                           annotation:annotation];
}

+(instancetype)ERN_createForMapView:(MKMapView *)mapView
                         annotation:(id<MKAnnotation>)annotation
{
    return [self ERN_createForMapView:mapView
                           annotation:annotation
                           identifier:NSStringFromClass([self class])];
}

#pragma mark - private

+(instancetype)ERN_createForMapView:(MKMapView *)mapView
                         annotation:(id<MKAnnotation>)annotation
                         identifier:(NSString *)identifier
{
    return [self ERN_createAnnotationView:[mapView
                                           dequeueReusableAnnotationViewWithIdentifier:identifier]
                               annotation:validateAnnotation(annotation)
                               identifier:identifier];
    
}

static id<MKAnnotation> validateAnnotation(id<MKAnnotation> annotation)
{
    return annotation ? annotation : [ERNNullAnnotation create];
}

+(instancetype)ERN_createAnnotationView:(MKAnnotationView *)view
                             annotation:(id<MKAnnotation>)annotation
                             identifier:(NSString *)identifier
{
    return view ? [view ERN_setupAnnotation:annotation] :
    [[self alloc] initWithAnnotation:annotation
                     reuseIdentifier:identifier];
}

-(instancetype)ERN_setupAnnotation:(id<MKAnnotation>)annotation
{
    [self setAnnotation:annotation];
    return self;
}

@end
