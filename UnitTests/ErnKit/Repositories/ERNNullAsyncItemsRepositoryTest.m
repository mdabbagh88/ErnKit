#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullAsyncItemsRepositoryTest.h"
#import "ERNNullAsyncItemsRepository.h"

@implementation ERNNullAsyncItemsRepositoryTest

-(void)testSingleton
{
    //given, when
    id<ERNAsyncItemsRepository> repository1 = [ERNNullAsyncItemsRepository create];
    id<ERNAsyncItemsRepository> repository2 = [ERNNullAsyncItemsRepository create];

    //then
    assertThat(repository1, notNilValue());
    assertThat(repository1, equalTo(repository2));
}

-(void)testItemAtIndex
{
    //given
    id<ERNAsyncItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    id<NSObject> item = [repository itemAtIndex:10];

    //then
    assertThat(item, equalTo([NSNull null]));
    
}

-(void)testEnumerateItemsUsingNilBlock
{
    //given
    id<ERNAsyncItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when, then
    [repository enumerateItemsUsingBlock:nil];
}

-(void)testEnumerateItemsUsingBlock
{
    //given
    id<ERNAsyncItemsRepository> repository = [ERNNullAsyncItemsRepository create];
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
    id<ERNAsyncItemsRepository> repository = [ERNNullAsyncItemsRepository create];

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
    id<ERNAsyncItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    [mockPredicate verify];
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
}

-(void)testCount
{
    //given
    id<ERNAsyncItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(0));
}

-(void)testLimit
{
    //given
    id<ERNAsyncItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(0));
}

-(void)testOffset
{
    //given
    id<ERNAsyncItemsRepository> repository = [ERNNullAsyncItemsRepository create];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(0));
}

@end
