#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMapViewDelegateTest.h"
#import "ERNMapViewDelegate.h"

@implementation ERNMapViewDelegateTest

-(void)testConstructor
{
    [ERNMapViewDelegate create];
}

-(void)testActionHandlerViewFactoryConstructor
{
    [ERNMapViewDelegate createWithActionHandler:nil
                                      viewFactory:nil];
}

@end
