#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ERNRoutingMapViewAnnotationViewFactoryTest.h"
#import "ERNMapViewAnnotationViewFactoryTest.h"
#import "ERNRoutingMapViewAnnotationViewFactory.h"
#import "ERNNullMapViewAnnotationViewFactory.h"

@implementation ERNRoutingMapViewAnnotationViewFactoryTest {
}

#pragma mark - ERNMapViewAnnotationViewFactory protocol tests

-(void)testMapViewAnnotationViewFactoryProtocolNilMappings
{
    [ERNMapViewAnnotationViewFactoryTest testMapViewAnnotationViewFactory:
     [ERNRoutingMapViewAnnotationViewFactory createWithMappings:nil]];
}

-(void)testMapViewAnnotationViewFactoryProtocolMappings
{
    NSDictionary *mappings = @{@"Key" : [ERNNullMapViewAnnotationViewFactory create]};
    [ERNMapViewAnnotationViewFactoryTest testMapViewAnnotationViewFactory:
     [ERNRoutingMapViewAnnotationViewFactory createWithMappings:mappings]];
}

@end
