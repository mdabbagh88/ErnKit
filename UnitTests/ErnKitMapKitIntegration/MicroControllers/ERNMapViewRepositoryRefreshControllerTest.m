#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <MapKit/MapKit.h>
#import "ERNMapViewRepositoryRefreshControllerTest.h"
#import "ERNMapViewRepositoryRefreshController.h"

@implementation ERNMapViewRepositoryRefreshControllerTest {
}

#pragma mark - class tests

-(void)testAutoZoomConstructorNilMapViewNilRepository
{
    assertThat([ERNMapViewRepositoryRefreshController createAutoZoomingWithMapView:nil
                                                                        repository:nil], notNilValue());
}

-(void)testConstructorNilMapViewNilRepository
{
    assertThat([ERNMapViewRepositoryRefreshController createWithMapView:nil
                                                             repository:nil], notNilValue());
}

-(void)testAutoZoomConstructorMapViewNilRepository
{
    id mockMapView = [OCMockObject mockForClass:[MKMapView class]];
    assertThat([ERNMapViewRepositoryRefreshController createAutoZoomingWithMapView:mockMapView
                                                                        repository:nil], notNilValue());
}

-(void)testConstructorMapViewNilRepository
{
    id mockMapView = [OCMockObject mockForClass:[MKMapView class]];
    assertThat([ERNMapViewRepositoryRefreshController createWithMapView:mockMapView
                                                             repository:nil], notNilValue());
}

-(void)testAutoZoomConstructorNilMapViewRepository
{
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    assertThat([ERNMapViewRepositoryRefreshController createAutoZoomingWithMapView:nil
                                                                        repository:mockRepository],
               notNilValue());
}

-(void)testConstructorNilMapViewRepository
{
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    assertThat([ERNMapViewRepositoryRefreshController createWithMapView:nil
                                                             repository:mockRepository],
               notNilValue());
}

-(void)testAutoZoomConstructorMapViewRepository
{
    id mockMapView = [OCMockObject mockForClass:[MKMapView class]];
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    assertThat([ERNMapViewRepositoryRefreshController createAutoZoomingWithMapView:mockMapView
                                                                        repository:mockRepository],
               notNilValue());
}

-(void)testConstructorMapViewRepository
{
    id mockMapView = [OCMockObject mockForClass:[MKMapView class]];
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    assertThat([ERNMapViewRepositoryRefreshController createWithMapView:mockMapView
                                                             repository:mockRepository],
               notNilValue());
}

@end
