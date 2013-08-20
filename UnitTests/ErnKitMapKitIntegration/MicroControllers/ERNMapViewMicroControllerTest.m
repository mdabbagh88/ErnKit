#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ERNMapViewMicroControllerTest.h"
#import "ERNMapViewMicroController.h"

@implementation ERNMapViewMicroControllerTest {
}

#pragma mark - class tests

-(void)testConstructorNilDelegateNilSuperView
{
    ERNMapViewMicroController *microController =
    [ERNMapViewMicroController createWithMapViewDelegate:nil
                                               superView:nil];
    assertThat(microController, notNilValue());
    assertThat([microController mapView], notNilValue());
    assertThat([[microController mapView] delegate], notNilValue());
}

-(void)testConstructorDelegateNilSuperView
{
    id mockDelegate = [OCMockObject mockForProtocol:@protocol(MKMapViewDelegate)];
    ERNMapViewMicroController *microController =
    [ERNMapViewMicroController createWithMapViewDelegate:mockDelegate
                                               superView:nil];
    assertThat(microController, notNilValue());
    assertThat([microController mapView], notNilValue());
    assertThat([[microController mapView] delegate], equalTo(mockDelegate));
}

-(void)testConstructorNilDelegateSuperView
{
    id mockView = [OCMockObject mockForClass:[UIView class]];
    [[mockView stub] bounds];
    [[mockView expect] addSubview:OCMOCK_ANY];
    ERNMapViewMicroController *microController =
    [ERNMapViewMicroController createWithMapViewDelegate:nil
                                               superView:mockView];
    assertThat(microController, notNilValue());
    assertThat([microController mapView], notNilValue());
    assertThat([[microController mapView] delegate], notNilValue());
}

-(void)testConstructorDelegateSuperView
{
    id mockDelegate = [OCMockObject niceMockForProtocol:@protocol(MKMapViewDelegate)];
    id mockView = [OCMockObject mockForClass:[UIView class]];
    [[mockView stub] bounds];
    [[mockView expect] addSubview:OCMOCK_ANY];
    ERNMapViewMicroController *microController =
    [ERNMapViewMicroController createWithMapViewDelegate:mockDelegate
                                               superView:mockView];
    assertThat(microController, notNilValue());
    assertThat([microController mapView], notNilValue());
    assertThat([[microController mapView] delegate], equalTo(mockDelegate));
}

@end
