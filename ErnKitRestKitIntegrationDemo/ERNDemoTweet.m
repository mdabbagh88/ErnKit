#import "ERNDemoTweet.h"
#import <objc/Protocol.h>

@implementation ERNDemoTweet

-(CLLocationCoordinate2D)coordinate
{
    return [self hasCoordinates] ? [self createCoordinate] : CLLocationCoordinate2DMake(0, 0);
}

-(CLLocationCoordinate2D)createCoordinate
{
    return CLLocationCoordinate2DMake([[self coordinates][1] doubleValue],
                                      [[self coordinates][0] doubleValue]);
}

-(BOOL)conformsToProtocol:(Protocol *)protocol
{
    return [self isInvalidAnnotation:protocol] ? NO : [super conformsToProtocol:protocol];
}

-(BOOL)isInvalidAnnotation:(Protocol *)protocol
{
    return [protocol isEqual:@protocol(MKAnnotation)] && ![self hasCoordinates];
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
