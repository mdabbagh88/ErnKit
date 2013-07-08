#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNItemsToAsyncPaginatedItemsRepositoryTest.h"
#import "ERNItemsToAsyncPaginatedItemsRepository.h"
#import "ERNAsyncPaginatedItemsRepositoryTest.h"
#import "ERNResource.h"
#import "ERNAsyncItemRepository.h"
#import "ERNItemRepositoryFactory.h"
#import "ERNNullAsyncItemsRepository.h"

@implementation ERNItemsToAsyncPaginatedItemsRepositoryTest {
}

#pragma mark - ERNAsyncPaginatedItemsRepository protocol tests

-(void)testAsyncPaginatedItemsRepositoryProtocolWithNilRepository
{
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNItemsToAsyncPaginatedItemsRepository createWithRepository:nil]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolWithRepository
{
    ERNNullAsyncItemsRepository *repository = [ERNNullAsyncItemsRepository create];
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNItemsToAsyncPaginatedItemsRepository createWithRepository:repository]];
}

@end
