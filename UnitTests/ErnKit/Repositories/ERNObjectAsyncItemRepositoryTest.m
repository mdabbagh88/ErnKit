#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNObjectAsyncItemRepositoryTest.h"
#import "ERNObjectAsyncItemRepository.h"
#import "ERNAsyncItemRepositoryTest.h"

@implementation ERNObjectAsyncItemRepositoryTest {
}

#pragma mark - ERNAsyncItemRepository protocol tests

-(void)testAsyncItemRepositoryProtocolWithNilItem
{
    [ERNAsyncItemRepositoryTest testAsyncItemRepository:
     [ERNObjectAsyncItemRepository createWithItem:nil]];
}

-(void)testAsyncItemRepositoryProtocolWithItem
{
    [ERNAsyncItemRepositoryTest testAsyncItemRepository:
     [ERNObjectAsyncItemRepository createWithItem:
      [OCMockObject mockForClass:[NSObject class]]]];
}

#pragma mark - class tests

-(void)testItemItem
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id<ERNAsyncItemRepository> repository =
    [ERNObjectAsyncItemRepository createWithItem:mockItem];

    //when
    id<NSObject> item = [repository item];

    //then
    assertThat(item, equalTo(mockItem));
}

@end
