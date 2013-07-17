#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullAsyncItemsRepositoryTest.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNAsyncItemsRepositoryTest.h"

@implementation ERNNullAsyncItemsRepositoryTest {
}

#pragma mark - ERNAsyncItemRepository protocol tests

-(void)testAsyncItemRepositoryProtocol
{
    [ERNAsyncItemsRepositoryTest testAsyncItemsRepository:[ERNNullAsyncItemsRepository create]];
}

#pragma mark - class tests

-(void)testItem
{
    //given
    id<ERNAsyncItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    id<NSObject> item = [repository itemAtIndex:10];

    //then
    assertThat(item, instanceOf([NSNull class]));
}

@end
