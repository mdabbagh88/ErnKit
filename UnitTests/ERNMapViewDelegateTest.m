#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMapViewDelegateTest.h"
#import "ERNMapViewDelegate.h"

@implementation ERNMapViewDelegateTest

-(void)testConstructor
{
    [ERNMapViewDelegate delegate];
}

-(void)testActionHandlerViewFactoryConstructor
{
    [ERNMapViewDelegate delegateWithActionHandler:nil
                                      viewFactory:nil];
}

@end
