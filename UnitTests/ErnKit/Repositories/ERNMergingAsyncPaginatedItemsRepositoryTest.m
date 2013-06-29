#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMergingAsyncPaginatedItemsRepositoryTest.h"
#import "ERNMergingAsyncPaginatedItemsRepository.h"
#import "ERNAsyncPaginatedItemsRepositoryTest.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"

@implementation ERNMergingAsyncPaginatedItemsRepositoryTest {
}

#pragma mark - ERNAsyncPaginatedItemsRepository protocol tests

-(void)testAsyncPaginatedItemsRepositoryProtocolNilFirstNilRest
{
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNMergingAsyncPaginatedItemsRepository createWithFirstRepository:nil
                                                         restRepository:nil]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolFirstNilRest
{
    id<ERNAsyncPaginatedItemsRepository> mockRepository =
    [ERNNullAsyncPaginatedItemsRepository create];
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNMergingAsyncPaginatedItemsRepository createWithFirstRepository:mockRepository
                                                         restRepository:nil]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolNilFirstRest
{
    id<ERNAsyncPaginatedItemsRepository> mockRepository =
    [ERNNullAsyncPaginatedItemsRepository create];
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNMergingAsyncPaginatedItemsRepository createWithFirstRepository:nil
                                                         restRepository:mockRepository]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolFirstRest
{
    id<ERNAsyncPaginatedItemsRepository> mockRepository =
    [ERNNullAsyncPaginatedItemsRepository create];
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNMergingAsyncPaginatedItemsRepository createWithFirstRepository:mockRepository
                                                         restRepository:mockRepository]];
}

@end
