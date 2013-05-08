#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNAsyncItemsRepositoryMapViewManagerTest.h"
#import "ERNAsyncItemsRepositoryMapViewManager.h"

@implementation ERNAsyncItemsRepositoryMapViewManagerTest

-(void)testConstructor
{
    [ERNAsyncItemsRepositoryMapViewManager createWithRepository:nil
                                                        mapView:nil];
}


-(void)testAutoZoomingConstructor
{
    [ERNAsyncItemsRepositoryMapViewManager createAutoZoomingWithRepository:nil
                                                                   mapView:nil];
}

@end
