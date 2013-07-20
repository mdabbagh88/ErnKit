#import "ERNNullMapViewAnnotationViewFactory.h"
#import <MapKit/MapKit.h>

static ERNNullMapViewAnnotationViewFactory *immutableSingleton;

@implementation ERNNullMapViewAnnotationViewFactory {
}

#pragma mark - public - constructors

    +(instancetype)create
    {
        return immutableSingleton;
    }

#pragma mark - ERNMapViewAnnotationViewFactory

-(MKAnnotationView *)annotationViewWithViewReuser:(MKAnnotationView *(^)(NSString *identifier)) __unused block
                                   fromAnnotation:(id<MKAnnotation>) __unused annotation
{
    return [MKPinAnnotationView new];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
