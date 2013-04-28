#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMapViewControllerTest.h"
#import "ERNMapViewController.h"

@implementation ERNMapViewControllerTest

-(void)testConstructor
{
    [ERNMapViewController viewControllerWithRepository:nil];
}

-(void)testRepositoryActionHandlerViewFactoryConstructor
{
    [ERNMapViewController viewControllerWithRepository:nil
                                         actionHandler:nil
                                           viewFactory:nil];
}

-(void)testAutoZoomingConstructor
{
    [ERNMapViewController autoZoomingViewControllerWithRepository:nil];
}

-(void)testAutoZoomingRepositoryActionHandlerViewFactoryConstructor
{
    [ERNMapViewController autoZoomingViewControllerWithRepository:nil
                                                    actionHandler:nil
                                                      viewFactory:nil];
}

@end
