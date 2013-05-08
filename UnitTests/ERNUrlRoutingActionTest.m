#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNUrlRoutingActionTest.h"
#import "ERNUrlRoutingAction.h"

@implementation ERNUrlRoutingActionTest

-(void)testHostsConstructor
{
    [ERNUrlRoutingAction createWithActionsForHosts:nil];
}

-(void)testSchmesConstructor
{
    [ERNUrlRoutingAction actionWithActionsForSchemes:nil];
}

@end
