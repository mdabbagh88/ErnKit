#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDefaultAsyncPaginatedItemsRepositoryTest.h"
#import "ERNDefaultAsyncPaginatedItemsRepository.h"
#import "ERNAsyncPaginatedItemsRepositoryTest.h"
#import "ERNResource.h"
#import "ERNAsyncItemRepository.h"
#import "ERNItemRepositoryFactory.h"
#import "ERNNullAsyncItemRepository.h"

@implementation ERNDefaultAsyncPaginatedItemsRepositoryTest {
}

#pragma mark - ERNAsyncPaginatedItemsRepository protocol tests

-(void)testAsyncPaginatedItemsRepositoryProtocolWithNilResourceNilItemRepositoryFactoryMaxWindowSize
{
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNDefaultAsyncPaginatedItemsRepository createWithResource:nil
                                           itemRepositoryFactory:nil
                                                      windowSize:UINT_MAX]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolWithResourceNilItemRepositoryFactoryMaxWindowSize
{
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNDefaultAsyncPaginatedItemsRepository createWithResource:[ERNResource createNull]
                                           itemRepositoryFactory:nil
                                                      windowSize:UINT_MAX]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolWithResourceItemRepositoryFactoryMaxWindowSize
{
    ERNResource *resource = [ERNResource createNull];
    id<ERNAsyncItemRepository> itemRepository = [ERNNullAsyncItemRepository create];
    id mockItemRepositoryFactory =
    [OCMockObject niceMockForProtocol:@protocol(ERNItemRepositoryFactory)];
    [[[mockItemRepositoryFactory stub]
      andReturn:itemRepository]
     itemRepositoryForResource:resource];
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNDefaultAsyncPaginatedItemsRepository createWithResource:resource
                                           itemRepositoryFactory:mockItemRepositoryFactory
                                                      windowSize:UINT_MAX]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolWithNilResourceItemRepositoryFactoryMaxWindowSize
{
    id<ERNAsyncItemRepository> itemRepository = [ERNNullAsyncItemRepository create];
    id mockItemRepositoryFactory =
    [OCMockObject niceMockForProtocol:@protocol(ERNItemRepositoryFactory)];
    [[[mockItemRepositoryFactory stub]
      andReturn:itemRepository]
     itemRepositoryForResource:OCMOCK_ANY];
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNDefaultAsyncPaginatedItemsRepository createWithResource:nil
                                           itemRepositoryFactory:mockItemRepositoryFactory
                                                      windowSize:UINT_MAX]];
}


-(void)testAsyncPaginatedItemsRepositoryProtocolWithResourceItemRepositoryFactoryWindowSize
{
    ERNResource *resource = [ERNResource createNull];
    id<ERNAsyncItemRepository> itemRepository = [ERNNullAsyncItemRepository create];
    id mockItemRepositoryFactory =
    [OCMockObject niceMockForProtocol:@protocol(ERNItemRepositoryFactory)];
    [[[mockItemRepositoryFactory stub]
      andReturn:itemRepository]
     itemRepositoryForResource:resource];
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNDefaultAsyncPaginatedItemsRepository createWithResource:resource
                                           itemRepositoryFactory:mockItemRepositoryFactory
                                                      windowSize:10]];
}

@end
