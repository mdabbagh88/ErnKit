#import "ERNDemoTweet.h"

@implementation ERNDemoTweet

-(CLLocationCoordinate2D)coordinate
{
    return [self hasCoordinates] ? [self createCoordinate] : CLLocationCoordinate2DMake(0, 0);
}

-(CLLocationCoordinate2D)createCoordinate
{
    double longitude = [[self coordinates][0] doubleValue];
    double latitude = [[self coordinates][1] doubleValue];
    return CLLocationCoordinate2DMake(latitude, longitude);
}

-(BOOL)conformsToProtocol:(Protocol *)protocol
{
    return [self isInvalidAnnotation:protocol] ? NO : [super conformsToProtocol:protocol];
}

-(BOOL)isInvalidAnnotation:(Protocol *)protocol
{
    return [(id)protocol isEqual:@protocol(MKAnnotation)] && ![self hasCoordinates];
}

-(BOOL)hasCoordinates
{
    return [[self coordinates] count] == 2;
}

-(NSString *)title
{
    return [self text];
}

- (NSString *)description
{
    return [self text];
}

@end
