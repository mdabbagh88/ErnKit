#import "ERNDemoTweet.h"
#import <objc/Protocol.h>

@interface ERNDemoTweet ()
@property (nonatomic, readonly, copy) NSString *text;
@property (nonatomic, readonly, copy) NSArray *coordinates;
@end

@implementation ERNDemoTweet

#pragma mark - MKAnnotation

-(CLLocationCoordinate2D)coordinate
{
    return [self hasCoordinates] ? [self createCoordinate] : CLLocationCoordinate2DMake(0, 0);
}

-(NSString *)title
{
    return [self text];
}

#pragma mark - NSObject

-(BOOL)conformsToProtocol:(Protocol *)protocol
{
    return [self isInvalidAnnotation:protocol] ? NO : [super conformsToProtocol:protocol];
}

- (NSString *)description
{
    return [self text];
}

#pragma mark - private

-(CLLocationCoordinate2D)createCoordinate
{
    return CLLocationCoordinate2DMake([[self coordinates][1] doubleValue],
                                      [[self coordinates][0] doubleValue]);
}

-(BOOL)isInvalidAnnotation:(Protocol *)protocol
{
    return [protocol isEqual:@protocol(MKAnnotation)] && ![self hasCoordinates];
}

-(BOOL)hasCoordinates
{
    return [[self coordinates] count] == 2;
}

@end
