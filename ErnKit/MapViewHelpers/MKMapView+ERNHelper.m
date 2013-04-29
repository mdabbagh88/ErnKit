#import "MKMapView+ERNHelper.h"

@implementation MKMapView (ERNHelper)

-(void)zoomToFitMapAnnotations
{
    [self setRegion:[self adjustRegion:[self regionThatFits:[self calculateZoomRegion]]]
           animated:YES];
}

-(MKCoordinateRegion)adjustRegion:(MKCoordinateRegion)region
{
    return MKCoordinateRegionMake(region.center,
                                  MKCoordinateSpanMake(fmin(180, region.span.latitudeDelta),
                                                       fmin(360, region.span.longitudeDelta)));
}

-(MKCoordinateRegion)calculateZoomRegion
{
    __block CLLocationCoordinate2D topLeftCoord = CLLocationCoordinate2DMake(-90, 180);
    __block CLLocationCoordinate2D bottomRightCoord = CLLocationCoordinate2DMake(90, -180);
    [[self annotations] enumerateObjectsUsingBlock:^(id<MKAnnotation> annotation, NSUInteger index, BOOL *stop) {
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

    return MKCoordinateRegionMake(CLLocationCoordinate2DMake([self latitudeCenterFromTop:topLeftCoord.latitude
                                                                                  bottom:bottomRightCoord.latitude],
                                                             [self longitudeCenterFromLeft:topLeftCoord.longitude
                                                                                     right:bottomRightCoord.longitude]),
                                  MKCoordinateSpanMake([self adjustDelta:fabs(topLeftCoord.latitude - bottomRightCoord.latitude)],
                                                       [self adjustDelta:fabs(bottomRightCoord.longitude - topLeftCoord.longitude)]));
}

-(CLLocationDegrees)latitudeCenterFromTop:(CLLocationDegrees)top
                                   bottom:(CLLocationDegrees)bottom
{
    return top - (top - bottom)*0.5;
}

-(CLLocationDegrees)longitudeCenterFromLeft:(CLLocationDegrees)left
                                    right:(CLLocationDegrees)right
{
    return left + (right - left)*0.5;
}

-(CLLocationDegrees)adjustDelta:(CLLocationDegrees)delta
{
    return delta == 0.0 ? 0.005 : delta*1.2;
}

@end
