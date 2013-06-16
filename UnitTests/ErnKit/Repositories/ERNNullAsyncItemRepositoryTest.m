#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullAsyncItemRepositoryTest.h"
#import "ERNNullAsyncItemRepository.h"

@implementation ERNNullAsyncItemRepositoryTest

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
