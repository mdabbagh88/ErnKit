#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMapViewControllerTest.h"
#import "ERNMapViewController.h"

@implementation ERNMapViewControllerTest

-(void)testConstructor
{
    [ERNMapViewController createWithRepository:nil];
}

-(void)testRepositoryActionHandlerViewFactoryConstructor
{
    [ERNMapViewController createWithRepository:nil
                                         actionHandler:nil
                                           viewFactory:nil];
}

-(void)testAutoZoomingConstructor
{
    [ERNMapViewController createAutoZoomingWithRepository:nil];
}

-(void)testAutoZoomingRepositoryActionHandlerViewFactoryConstructor
{
    [ERNMapViewController createAutoZoomingWithRepository:nil
                                                    actionHandler:nil
                                                      viewFactory:nil];
}

@end
