#import "MKAnnotationView+ERNHelper.h"
#import "NSObject+ERNHelper.h"
#import "ERNNullAnnotation.h"

@implementation MKAnnotationView (ERNHelper)

#pragma mark - public - constructors

+(instancetype)createWithAnnotation:(id<MKAnnotation>)annotation
{
    return [self createForMapView:nil
                       annotation:annotation];
}

+(instancetype)createForMapView:(MKMapView *)mapView
                     annotation:(id<MKAnnotation>)annotation
{
    return [self createForMapView:mapView
                       annotation:annotation
                       identifier:NSStringFromClass([self class])];
}

#pragma mark - private

+(instancetype)createForMapView:(MKMapView *)mapView
                     annotation:(id<MKAnnotation>)annotation
                     identifier:(NSString *)identifier
{
    return [self createAnnotationView:[mapView
                                       dequeueReusableAnnotationViewWithIdentifier:identifier]
                           annotation:[self validateAnnotation:annotation]
                           identifier:identifier];

}

+(id<MKAnnotation>)validateAnnotation:(id<MKAnnotation>)annotation
{
    return annotation ? annotation : [ERNNullAnnotation create];
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
