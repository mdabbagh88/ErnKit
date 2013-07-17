#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNItemToPaginatedItemsRepositoryTest.h"
#import "ERNItemToPaginatedItemsRepository.h"
#import "ERNAsyncItemRepository.h"
#import "ERNAsyncPaginatedItemsRepositoryTest.h"
#import "ERNNullAsyncItemRepository.h"

@implementation ERNItemToPaginatedItemsRepositoryTest {
}

#pragma mark - ERNAsyncPaginatedItemsRepository protocol tests

-(void)testAsyncPaginatedItemsRepositoryProtocolWithNilRepository
{
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNItemToPaginatedItemsRepository createWithRepository:nil]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolWithRepository
{
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNItemToPaginatedItemsRepository createWithRepository:[ERNNullAsyncItemRepository create]]];
}

#pragma mark - class tests

-(void)testOffsetNilRepository
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:nil];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(0));
}

-(void)testTotalNilRepository
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:nil];

    //when
    NSUInteger total = [repository total];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(1));
}

-(void)testFetchedNilRepository
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:nil];

    assertThat(repository, hasCountOf(1));
}

-(void)testEnumerateItemsUsingBlockNilRepository
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:nil];
    __block NSUInteger called = 0;

    //when
    [repository enumerateItemsUsingBlock:
     ^(id<NSObject> item, NSUInteger index, BOOL *stop) {
         ++called;
    }];

    //then
    assertThatUnsignedInteger(called, equalToUnsignedInteger(1));
}

-(void)testFilteredArrayUsingPredicateNilRepository
{
    //given
    id expectedItem = [NSNull null];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    [[[mockPredicate expect] andReturnValue:@YES] evaluateWithObject:expectedItem];
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:nil];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    [mockPredicate verify];
    assertThat(array, notNilValue());
    assertThat(array, hasCountOf(1));
    assertThat(array[0], equalTo(expectedItem));
}

-(void)testItemAtIndexNilRepository
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:nil];

    //when
    id<NSObject> item = [repository itemAtIndex:0];

    //then
    assertThat(item, notNilValue());
    assertThat(item, instanceOf([NSNull class]));
}

-(void)testItemAtIndexOutOfBoundsNilRepository
{
    //given
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:nil];

    //when
    id<NSObject> item = [repository itemAtIndex:10];

    //then
    assertThat(item, notNilValue());
    assertThat(item, instanceOf([NSNull class]));
}

-(void)testOffsetRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:mockRepository];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(0));
}

-(void)testTotalRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:mockRepository];

    //when
    NSUInteger total = [repository total];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(1));
}

-(void)testFetchedRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:mockRepository];

    assertThat(repository, hasCountOf(1));
}

-(void)testEnumerateItemsUsingBlockRepository
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    [[[mockRepository expect] andReturn:mockItem] item];
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:mockRepository];
    __block NSUInteger called = 0;

    //when
    [repository enumerateItemsUsingBlock:
     ^(id<NSObject> item, NSUInteger index, BOOL *stop) {
         ++called;
         assertThat(item, equalTo(mockItem));
     }];

    //then
    assertThatUnsignedInteger(called, equalToUnsignedInteger(1));
}

-(void)testFilteredArrayUsingPredicateRepository
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    [[[mockRepository expect] andReturn:mockItem] item];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    [[[mockPredicate expect] andReturnValue:@YES] evaluateWithObject:mockItem];
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:mockRepository];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    [mockPredicate verify];
    assertThat(array, notNilValue());
    assertThat(array, hasCountOf(1));
    assertThat(array[0], equalTo(mockItem));
}

-(void)testItemAtIndexOutOfBoundsRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    id<ERNAsyncPaginatedItemsRepository> repository =
    [ERNItemToPaginatedItemsRepository createWithRepository:mockRepository];

    //when
    id<NSObject> item = [repository itemAtIndex:10];

    //then
    assertThat(item, notNilValue());
    assertThat(item, instanceOf([NSNull class]));
}

@end
