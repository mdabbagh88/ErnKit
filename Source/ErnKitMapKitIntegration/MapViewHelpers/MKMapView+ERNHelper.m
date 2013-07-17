#import "MKMapView+ERNHelper.h"

@implementation MKMapView (ERNHelper)

#pragma mark - public

-(void)ERN_zoomToFitMapAnnotations
{
    [self setRegion:adjustRegion([self regionThatFits:[self ERN_calculateZoomRegion]])
           animated:YES];
}

#pragma mark - private

static MKCoordinateRegion adjustRegion(MKCoordinateRegion region)
{
    return MKCoordinateRegionMake(region.center,
                                  MKCoordinateSpanMake(fmin(180, region.span.latitudeDelta),
                                                       fmin(360, region.span.longitudeDelta)));
}

-(MKCoordinateRegion)ERN_calculateZoomRegion
{
    __block CLLocationCoordinate2D topLeftCoord = CLLocationCoordinate2DMake(-90, 180);
    __block CLLocationCoordinate2D bottomRightCoord = CLLocationCoordinate2DMake(90, -180);
    [[self annotations] enumerateObjectsUsingBlock:
     ^(id<MKAnnotation> annotation, __unused NSUInteger index, __unused BOOL *stop) {
         CLLocationCoordinate2D coordinate = [annotation coordinate];
         topLeftCoord.longitude = fmin(topLeftCoord.longitude,
                                       coordinate.longitude);
         topLeftCoord.latitude = fmax(topLeftCoord.latitude,
                                      coordinate.latitude);
         bottomRightCoord.longitude = fmax(bottomRightCoord.longitude,
                                           coordinate.longitude);
         bottomRightCoord.latitude = fmin(bottomRightCoord.latitude,
                                          coordinate.latitude);
     }];
    
    CLLocationDegrees latitude = latitudeCenter(topLeftCoord.latitude,
                                                bottomRightCoord.latitude);
    CLLocationDegrees longitude = longitudeCenter(topLeftCoord.longitude,
                                                  bottomRightCoord.longitude);

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    CLLocationDegrees latitudeDelta =
    adjustDelta(fabs(topLeftCoord.latitude - bottomRightCoord.latitude));
    
    CLLocationDegrees longitudeDelta =
    adjustDelta(fabs(bottomRightCoord.longitude - topLeftCoord.longitude));
    
    MKCoordinateSpan span = MKCoordinateSpanMake(latitudeDelta, longitudeDelta);
    
    return MKCoordinateRegionMake(coordinate, span);
}

static CLLocationDegrees latitudeCenter(CLLocationDegrees top, CLLocationDegrees bottom)
{
    return top - (top - bottom)*0.5;
}

static CLLocationDegrees longitudeCenter(CLLocationDegrees left, CLLocationDegrees right)
{
    return left + (right - left)*0.5;
}

static CLLocationDegrees adjustDelta(CLLocationDegrees delta)
{
    return delta == 0.0 ? 0.005 : delta*1.2;
}

@end
