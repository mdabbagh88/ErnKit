#import "ERNDemoTweet.h"
#import <objc/Protocol.h>

@implementation ERNDemoTweet

-(CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(0, 0);
    if ([[self coordinates] count] == 2) {
        double longitude = [[self coordinates][0] doubleValue];
        double latitude = [[self coordinates][1] doubleValue];
        coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    }
    return coordinate;
}

-(BOOL)conformsToProtocol:(Protocol *)protocol
{
    if ([protocol isEqual:@protocol(MKAnnotation)] && [[self coordinates] count] != 2) {
        return NO;
    }
    return[super conformsToProtocol:protocol];
}

-(NSString *)title
{
    return [self text];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ (ID: %@)", [self text], [self statusID]];
}

@end
