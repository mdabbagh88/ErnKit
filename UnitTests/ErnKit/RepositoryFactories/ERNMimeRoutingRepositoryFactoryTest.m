#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMimeRoutingRepositoryFactoryTest.h"
#import "ERNMimeRoutingRepositoryFactory.h"
#import "ERNRepositoryFactoryTest.h"

@implementation ERNMimeRoutingRepositoryFactoryTest {
}

#pragma mark - ERNRepositoryFactory protocol tests

-(void)testRepositoryFactoryProtocolNilRepositoryFactories
{
    [ERNRepositoryFactoryTest testRepositoryFactory:
     [ERNMimeRoutingRepositoryFactory createWithRepositoryFactories:nil]];
}

-(void)testRepositoryFactoryProtocolNonRepositoryFactories
{
    [ERNRepositoryFactoryTest testRepositoryFactory:
     [ERNMimeRoutingRepositoryFactory createWithRepositoryFactories:@{@"a" : @"b", @"c" : @[]}]];
}

-(void)testRepositoryFactoryProtocolRepositoryFactories
{
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [ERNRepositoryFactoryTest testRepositoryFactory:
     [ERNMimeRoutingRepositoryFactory createWithRepositoryFactories:@{
                                                                      @"" : mockRepositoryFactory
                                                                      }]];
}

@end
