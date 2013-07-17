#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullAsyncPaginatedItemsRepositoryTest.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"
#import "ERNAsyncPaginatedItemsRepositoryTest.h"

@implementation ERNNullAsyncPaginatedItemsRepositoryTest {
}

#pragma mark - ERNAsyncPaginatedItemsRepository protocol test

-(void)testAsyncPaginatedItemsRepositoryProtocol
{
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNNullAsyncPaginatedItemsRepository create]];
}

#pragma mark - class tests

-(void)testItemAtIndex
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

    //when
    id<NSObject> item = [repository itemAtIndex:10];

    //then
    assertThat(item, instanceOf([NSNull class]));
    
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

-(void)testCount
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository = [ERNNullAsyncPaginatedItemsRepository create];

    assertThat(repository, isEmpty());
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

@end
