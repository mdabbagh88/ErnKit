#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ERNNullAnnotationTest.h"
#import "ERNNullAnnotation.h"

@implementation ERNNullAnnotationTest

-(void)testSingleton
{
    //given, when
    id<MKAnnotation> annotation1 = [ERNNullAnnotation create];
    id<MKAnnotation> annotation2 = [ERNNullAnnotation create];

    //then
    assertThat(annotation1, notNilValue());
    assertThat(annotation1, equalTo(annotation2));
}

-(void)testCoordinate
{
    //given
    id<MKAnnotation> annotation = [ERNNullAnnotation create];

    //when
    CLLocationCoordinate2D coordinate = [annotation coordinate];

    //then
    assertThatDouble(coordinate.longitude, equalToDouble(0.0f));
    assertThatDouble(coordinate.latitude, equalToDouble(0.0f));
}

@end
