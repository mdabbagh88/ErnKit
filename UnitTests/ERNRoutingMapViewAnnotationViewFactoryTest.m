#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRoutingMapViewAnnotationViewFactoryTest.h"
#import "ERNRoutingMapViewAnnotationViewFactory.h"

@implementation ERNRoutingMapViewAnnotationViewFactoryTest

-(void)testConstructor
{
    [ERNRoutingMapViewAnnotationViewFactory factoryWithMappings:nil];
}

@end
