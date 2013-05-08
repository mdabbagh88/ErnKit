#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRoutingTableViewCellFactoryTest.h"
#import "ERNRoutingTableViewCellFactory.h"

@implementation ERNRoutingTableViewCellFactoryTest

-(void)testConstructor
{
    [ERNRoutingTableViewCellFactory create];
}

-(void)testMappingsConstructor
{
    [ERNRoutingTableViewCellFactory createWithMappings:nil];
}

-(void)testMappingsDefaultFactoryConstructor
{
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                                      defaultFactory:nil];
}

@end
