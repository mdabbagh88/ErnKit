#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullAsyncItemRepositoryTest.h"
#import "ERNNullAsyncItemRepository.h"

@implementation ERNNullAsyncItemRepositoryTest

-(void)testSingleton
{
    //given, when
    id<ERNAsyncItemRepository> repository1 = [ERNNullAsyncItemRepository create];
    id<ERNAsyncItemRepository> repository2 = [ERNNullAsyncItemRepository create];

    //then
    assertThat(repository1, notNilValue());
    assertThat(repository1, equalTo(repository2));
}

-(void)testItem
{
    //given
    id<ERNAsyncItemRepository> repository = [ERNNullAsyncItemRepository create];

    //when
    id<NSObject> item = [repository item];

    //then
    assertThat(item, equalTo([NSNull null]));

}

@end
