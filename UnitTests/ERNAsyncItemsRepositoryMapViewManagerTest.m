#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNAsyncItemsRepositoryMapViewManagerTest.h"
#import "ERNAsyncItemsRepositoryMapViewManager.h"

@implementation ERNAsyncItemsRepositoryMapViewManagerTest

-(void)testConstructor
{
    [ERNAsyncItemsRepositoryMapViewManager mapViewManagerWithRepository:nil
                                                                mapView:nil];
}


-(void)testAutoZoomingConstructor
{
    [ERNAsyncItemsRepositoryMapViewManager autoZoomingMapViewManagerWithRepository:nil
                                                                           mapView:nil];
}

@end
