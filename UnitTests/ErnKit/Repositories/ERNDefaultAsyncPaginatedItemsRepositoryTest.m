#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDefaultAsyncPaginatedItemsRepositoryTest.h"
#import "ERNDefaultAsyncPaginatedItemsRepository.h"
#import "ERNAsyncPaginatedItemsRepositoryTest.h"
#import "ERNNullResource.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"
#import "ERNAsyncItemRepository.h"
#import "ERNRepositoryFactory.h"

@implementation ERNDefaultAsyncPaginatedItemsRepositoryTest {
}

#pragma mark - ERNAsyncPaginatedItemsRepository protocol tests

-(void)testAsyncPaginatedItemsRepositoryProtocolWithNilResourceNilItemRepositoryFactoryMaxWindowSize
{
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNDefaultAsyncPaginatedItemsRepository createWithResource:nil
                                               repositoryFactory:nil
                                                      windowSize:UINT_MAX]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolWithResourceNilItemRepositoryFactoryMaxWindowSize
{
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNDefaultAsyncPaginatedItemsRepository createWithResource:[ERNNullResource create]
                                               repositoryFactory:nil
                                                      windowSize:UINT_MAX]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolWithResourceItemRepositoryFactoryMaxWindowSize
{
    ERNResource *resource = [ERNNullResource create];
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [[[mockRepositoryFactory stub] andReturn:repository] repositoryForResource:resource];
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNDefaultAsyncPaginatedItemsRepository createWithResource:resource
                                           repositoryFactory:mockRepositoryFactory
                                                      windowSize:UINT_MAX]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolWithNilResourceItemRepositoryFactoryMaxWindowSize
{
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [[[mockRepositoryFactory stub] andReturn:repository] repositoryForResource:OCMOCK_ANY];
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNDefaultAsyncPaginatedItemsRepository createWithResource:nil
                                               repositoryFactory:mockRepositoryFactory
                                                      windowSize:UINT_MAX]];
}


-(void)testAsyncPaginatedItemsRepositoryProtocolWithResourceItemRepositoryFactoryWindowSize
{
    ERNResource *resource = [ERNNullResource create];
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [[[mockRepositoryFactory stub] andReturn:repository] repositoryForResource:resource];
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNDefaultAsyncPaginatedItemsRepository createWithResource:resource
                                               repositoryFactory:mockRepositoryFactory
                                                      windowSize:10]];
}

@end
