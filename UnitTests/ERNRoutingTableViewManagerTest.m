#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRoutingTableViewManagerTest.h"
#import "ERNMergingTableViewManager.h"

@implementation ERNRoutingTableViewManagerTest

-(void)testConstructor
{
    [ERNMergingTableViewManager tableViewManagerWithFirstTableViewManager:nil
                                                     restTableViewManager:nil];
}

@end
