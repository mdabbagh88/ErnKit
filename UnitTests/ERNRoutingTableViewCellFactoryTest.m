#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRoutingTableViewCellFactoryTest.h"
#import "ERNRoutingTableViewCellFactory.h"

@implementation ERNRoutingTableViewCellFactoryTest

-(void)testConstructor
{
    [ERNRoutingTableViewCellFactory tableViewCellFactory];
}

-(void)testMappingsConstructor
{
    [ERNRoutingTableViewCellFactory tableViewCellFactoryWithMappings:nil];
}

-(void)testMappingsDefaultFactoryConstructor
{
    [ERNRoutingTableViewCellFactory tableViewCellFactoryWithMappings:nil
                                                      defaultFactory:nil];
}

@end
