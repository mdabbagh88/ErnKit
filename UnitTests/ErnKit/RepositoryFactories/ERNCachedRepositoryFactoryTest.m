#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNCachedRepositoryFactoryTest.h"
#import "ERNCachedRepositoryFactory.h"
#import "ERNRepositoryFactoryTest.h"
#import "ERNNullAsyncRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"

@implementation ERNCachedRepositoryFactoryTest {
}

#pragma mark - ERNRepositoryFactory protocol tests

-(void)testRepositoryFactoryProtocolNilFirstNilRest
{
    [ERNRepositoryFactoryTest testRepositoryFactory:
     [ERNCachedRepositoryFactory createWithFirst:nil
                                            rest:nil]];
}

-(void)testRepositoryFactoryProtocolFirstNilRest
{
    [ERNRepositoryFactoryTest testRepositoryFactory:
     [ERNCachedRepositoryFactory createWithFirst:[self createMockRepositoryFactory]
                                            rest:nil]];
}

-(void)testRepositoryFactoryProtocolNilFirstRest
{
    [ERNRepositoryFactoryTest testRepositoryFactory:
     [ERNCachedRepositoryFactory createWithFirst:nil
                                            rest:[self createMockRepositoryFactory]]];
}

-(void)testRepositoryFactoryProtocolFirstRest
{

    [ERNRepositoryFactoryTest testRepositoryFactory:
     [ERNCachedRepositoryFactory createWithFirst:[self createMockRepositoryFactory]
                                            rest:[self createMockRepositoryFactory]]];
}

-(id)createMockRepositoryFactory
{
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [[[mockRepositoryFactory stub] andReturn:[ERNNullAsyncRepository create]]
     repositoryForResource:OCMOCK_ANY];
    [[[mockRepositoryFactory stub] andReturn:[ERNNullAsyncItemRepository create]]
     itemRepositoryForResource:OCMOCK_ANY];
    [[[mockRepositoryFactory stub] andReturn:[ERNNullAsyncItemsRepository create]]
     itemsRepositoryForResource:OCMOCK_ANY];
    [[[mockRepositoryFactory stub] andReturn:[ERNNullAsyncPaginatedItemsRepository create]]
     paginatedItemsRepositoryForResource:OCMOCK_ANY];
    return mockRepositoryFactory;
}

@end
