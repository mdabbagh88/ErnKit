#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMimeRoutingActionTest.h"
#import "ERNMimeRoutingAction.h"

@implementation ERNMimeRoutingActionTest

-(void)testConstructor
{
    [ERNMimeRoutingAction actionWithActionsForMimes:nil];
}

@end
