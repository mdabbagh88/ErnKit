#import "ERNNullMapViewAnnotationViewFactory.h"
#import "ERNNullAnnotation.h"
#import "ERNErrorHandler.h"
#import <MapKit/MapKit.h>

@implementation ERNNullMapViewAnnotationViewFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNMapViewAnnotationViewFactory

-(MKAnnotationView *)annotationViewWithViewReuser:(MKAnnotationView *(^)(NSString *identifier)) __unused block
                                   fromAnnotation:(id<MKAnnotation>) __unused annotation
{
    return [[MKPinAnnotationView alloc] initWithAnnotation:[ERNNullAnnotation create]
                                           reuseIdentifier:NSStringFromClass([ERNNullAnnotation class])];
}

@end
