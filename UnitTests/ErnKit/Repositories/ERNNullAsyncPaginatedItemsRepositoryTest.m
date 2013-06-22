#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullAsyncPaginatedItemsRepositoryTest.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"

@implementation ERNNullAsyncPaginatedItemsRepositoryTest

-(void)testItemAtIndex
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

    //when
    id<NSObject> item = [repository itemAtIndex:10];

    //then
    assertThat(item, equalTo([NSNull null]));
    
}

-(void)testEnumerateItemsUsingNilBlock
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

    //when, then
    [repository enumerateItemsUsingBlock:nil];
}

-(void)testEnumerateItemsUsingBlock
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];
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
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

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
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

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
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

    //when
    NSUInteger total = [repository total];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(0));
}

-(void)testFetched
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(0));
}

-(void)testOffset
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(0));
}

-(void)testHasPrevious
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

    //when
    BOOL hasPrevious = [repository hasPrevious];

    //then
    assertThatBool(hasPrevious, equalToBool(NO));
}

-(void)testHasNext
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

    //when
    BOOL hasNext = [repository hasNext];

    //then
    assertThatBool(hasNext, equalToBool(NO));
}

-(void)testFetchNext
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

    //when, then
    [repository fetchNext];
}

-(void)testFetchPrevious
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

    //when, then
    [repository fetchPrevious];
}

@end
