#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNItemsToAsyncItemRepositoryTest.h"
#import "ERNItemsToAsyncItemRepository.h"
#import "ERNAsyncPaginatedItemsRepository.h"

@implementation ERNItemsToAsyncItemRepositoryTest

-(void)testItemNilRepository
{
    //given
    id<ERNAsyncItemRepository> repository =
    [ERNItemsToAsyncItemRepository createWithRepository:nil];

    //when
    id<NSObject> item = [repository item];

    //then
    assertThat([item class], equalTo([NSNull class]));
}

-(void)testItemRepository
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository expect] andReturn:mockItem] itemAtIndex:0];
    id<ERNAsyncItemRepository> repository =
    [ERNItemsToAsyncItemRepository createWithRepository:mockRepository];

    //when
    id<NSObject> item = [repository item];

    //then
    [mockRepository verify];
    assertThat(item, equalTo(mockItem));
}

@end
