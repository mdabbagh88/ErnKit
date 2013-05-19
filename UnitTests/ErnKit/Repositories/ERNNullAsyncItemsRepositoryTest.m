#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullAsyncItemsRepositoryTest.h"
#import "ERNNullAsyncItemsRepository.h"

@implementation ERNNullAsyncItemsRepositoryTest

-(void)testSingleton
{
    //given, when
    id<ERNAsyncPaginatedItemsRepository> repository1 = [ERNNullAsyncItemsRepository create];
    id<ERNAsyncPaginatedItemsRepository> repository2 = [ERNNullAsyncItemsRepository create];

    //then
    assertThat(repository1, notNilValue());
    assertThat(repository1, equalTo(repository2));
}

-(void)testItemAtIndex
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    id<NSObject> item = [repository itemAtIndex:10];

    //then
    assertThat(item, equalTo([NSNull null]));
    
}

-(void)testEnumerateItemsUsingNilBlock
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when, then
    [repository enumerateItemsUsingBlock:nil];
}

-(void)testEnumerateItemsUsingBlock
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncItemsRepository create];
    __block BOOL called = NO;

    //when
    [repository enumerateItemsUsingBlock:
     ^(id<NSObject> item, NSUInteger index, BOOL *stop) {
        called = YES;
     }];

    //then
    assertThatBool(called, equalToBool(NO));
}

-(void)testFilteredArrayUsingNilPredicate
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:nil];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
}

-(void)testFilteredArrayUsingPredicate
{
    //given
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    [mockPredicate verify];
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
}

-(void)testTotal
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    NSUInteger total = [repository total];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(0));
}

-(void)testFetched
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    NSUInteger fetched = [repository fetched];

    //then
    assertThatUnsignedInteger(fetched, equalToUnsignedInteger(0));
}

-(void)testOffset
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(0));
}

@end
