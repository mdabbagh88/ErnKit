#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ERNNullMapViewDelegateTest.h"
#import "ERNNullMapViewDelegate.h"

@implementation ERNNullMapViewDelegateTest

-(void)testSingleton
{
    //given, when
    id<MKMapViewDelegate> delegate1 = [ERNNullMapViewDelegate create];
    id<MKMapViewDelegate> delegate2 = [ERNNullMapViewDelegate create];

    //then
    assertThat(delegate1, notNilValue());
    assertThat(delegate1, equalTo(delegate2));
}

-(void)testConstructor
{
    //given, when
    id<MKMapViewDelegate> delegate = [ERNNullMapViewDelegate create];

    //then
    assertThat(delegate, notNilValue());
}

@end
