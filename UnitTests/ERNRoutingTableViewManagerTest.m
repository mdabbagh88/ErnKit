#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRoutingTableViewManagerTest.h"
#import "ERNRoutingTableViewManager.h"

@implementation ERNRoutingTableViewManagerTest

-(void)testConstructor
{
    [ERNRoutingTableViewManager tableViewManagerWithFirstTableViewManager:nil
                                                     restTableViewManager:nil];
}

@end
