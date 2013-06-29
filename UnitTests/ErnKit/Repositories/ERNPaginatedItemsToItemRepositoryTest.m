#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNPaginatedItemsToItemRepositoryTest.h"
#import "ERNPaginatedItemsToItemRepository.h"
#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNAsyncItemRepositoryTest.h"

@implementation ERNPaginatedItemsToItemRepositoryTest {
}

#pragma mark - ERNAsyncItemRepository protocol test

-(void)testAsyncItemRepositoryProtocolWithNilRepository
{
    [ERNAsyncItemRepositoryTest testAsyncItemRepository:
     [ERNPaginatedItemsToItemRepository createWithRepository:nil]];
}

-(void)testAsyncItemRepositoryProtocolWithRepository
{
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository =
    [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository stub] andReturn:mockItem] itemAtIndex:0];
    [ERNAsyncItemRepositoryTest testAsyncItemRepository:
     [ERNPaginatedItemsToItemRepository createWithRepository:mockRepository]];
}

#pragma mark - class tests

-(void)testItemRepository
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository expect] andReturn:mockItem] itemAtIndex:0];
    id<ERNAsyncItemRepository> repository =
    [ERNPaginatedItemsToItemRepository createWithRepository:mockRepository];

    //when
    id<NSObject> item = [repository item];

    //then
    [mockRepository verify];
    assertThat(item, equalTo(mockItem));
}

@end
