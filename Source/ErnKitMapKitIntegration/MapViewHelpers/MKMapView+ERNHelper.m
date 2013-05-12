#import "MKMapView+ERNHelper.h"

@implementation MKMapView (ERNHelper)

#pragma mark - public

-(void)ERN_zoomToFitMapAnnotations
{
    [self setRegion:[self ERN_adjustRegion:[self regionThatFits:[self ERN_calculateZoomRegion]]]
           animated:YES];
}

#pragma mark - private

-(MKCoordinateRegion)ERN_adjustRegion:(MKCoordinateRegion)region
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
     ^(id<MKAnnotation> annotation, NSUInteger index, BOOL *stop) {
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
    
    CLLocationDegrees latitude = [self ERN_latitudeCenterFromTop:topLeftCoord.latitude
                                                          bottom:bottomRightCoord.latitude];
    
    CLLocationDegrees longitude = [self ERN_longitudeCenterFromLeft:topLeftCoord.longitude
                                                              right:bottomRightCoord.longitude];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    CLLocationDegrees latitudeDelta =
    [self ERN_adjustDelta:fabs(topLeftCoord.latitude - bottomRightCoord.latitude)];
    
    CLLocationDegrees longitudeDelta =
    [self ERN_adjustDelta:fabs(bottomRightCoord.longitude - topLeftCoord.longitude)];
    
    MKCoordinateSpan span = MKCoordinateSpanMake(latitudeDelta, longitudeDelta);
    
    return MKCoordinateRegionMake(coordinate, span);
}

-(CLLocationDegrees)ERN_latitudeCenterFromTop:(CLLocationDegrees)top
                                       bottom:(CLLocationDegrees)bottom
{
    return top - (top - bottom)*0.5;
}

-(CLLocationDegrees)ERN_longitudeCenterFromLeft:(CLLocationDegrees)left
                                          right:(CLLocationDegrees)right
{
    return left + (right - left)*0.5;
}

-(CLLocationDegrees)ERN_adjustDelta:(CLLocationDegrees)delta
{
    return delta == 0.0 ? 0.005 : delta*1.2;
}

@end
