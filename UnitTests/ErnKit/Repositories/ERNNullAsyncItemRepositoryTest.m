#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullAsyncItemRepositoryTest.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNAsyncItemRepositoryTest.h"

@implementation ERNNullAsyncItemRepositoryTest {
}

#pragma mark - ERNAsyncItemRepository protocol tests

-(void)testAsyncItemRepositoryProtocol
{
    [ERNAsyncItemRepositoryTest testAsyncItemRepository:[ERNNullAsyncItemRepository create]];
}

#pragma mark - class tests

-(void)testItem
{
    //given
    id<ERNAsyncItemRepository> repository = [ERNNullAsyncItemRepository create];

    //when
    id<NSObject> item = [repository item];

    //then
    assertThat(item, instanceOf([NSNull class]));
}

@end
