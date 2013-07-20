#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ERNNullMapViewAnnotationViewFactoryTest.h"
#import "ERNMapViewAnnotationViewFactoryTest.h"
#import "ERNNullMapViewAnnotationViewFactory.h"

@implementation ERNNullMapViewAnnotationViewFactoryTest {
}

#pragma mark - ERNMapViewAnnotationViewFactory protocol tests

-(void)testMapViewAnnotationViewFactoryProtocol
{
    [ERNMapViewAnnotationViewFactoryTest testMapViewAnnotationViewFactory:
     [ERNNullMapViewAnnotationViewFactory create]];
}

@end
