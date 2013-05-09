#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNObjectAsyncItemRepositoryTest.h"
#import "ERNObjectAsyncItemRepository.h"

@implementation ERNObjectAsyncItemRepositoryTest

-(void)testItemNilItem
{
    //given
    id<ERNAsyncItemRepository> repository =
    [ERNObjectAsyncItemRepository createWithItem:nil];

    //when
    id<NSObject> item = [repository item];

    //then
    assertThat(item, equalTo([NSNull null]));
}

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
