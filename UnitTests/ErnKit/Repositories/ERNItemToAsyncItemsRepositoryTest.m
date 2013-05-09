#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNItemToAsyncItemsRepositoryTest.h"
#import "ERNItemToAsyncItemsRepository.h"
#import "ERNAsyncItemRepository.h"

@implementation ERNItemToAsyncItemsRepositoryTest

-(void)testOffsetNilRepository
{
    //given
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:nil];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(0));
}

-(void)testCountNilRepository
{
    //given
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:nil];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(1));
}

-(void)testLimitNilRepository
{
    //given
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:nil];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(1));
}

-(void)testEnumerateItemsUsingBlockNilRepository
{
    //given
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:nil];
    __block NSUInteger called = 0;

    //when
    [repository enumerateItemsUsingBlock:
     ^(id<NSObject> item, NSUInteger index, BOOL *stop) {
         ++called;
    }];

    //then
    assertThatUnsignedInteger(called, equalToUnsignedInteger(1));
}

-(void)testEnumerateItemsUsingNilBlockNilRepository
{
    //given
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:nil];

    //when, then
    [repository enumerateItemsUsingBlock:nil];
}

-(void)testFilteredArrayUsingPredicateNilRepository
{
    //given
    id expectedItem = [NSNull null];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    [[[mockPredicate expect] andReturnValue:@YES] evaluateWithObject:expectedItem];
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:nil];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    [mockPredicate verify];
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(1));
    assertThat(array[0], equalTo(expectedItem));
}

-(void)testFilteredArrayUsingNilPredicateNilRepository
{
    //given
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:nil];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:nil];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
}

-(void)testItemAtIndexNilRepository
{
    //given
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:nil];

    //when
    id<NSObject> item = [repository itemAtIndex:0];

    //then
    assertThat(item, notNilValue());
    assertThat([item class], equalTo([NSNull class]));
}

-(void)testItemAtIndexOutOfBoundsNilRepository
{
    //given
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:nil];

    //when
    id<NSObject> item = [repository itemAtIndex:10];

    //then
    assertThat(item, notNilValue());
    assertThat([item class], equalTo([NSNull class]));
}

-(void)testOffsetRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:mockRepository];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(0));
}

-(void)testCountRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:mockRepository];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(1));
}

-(void)testLimitRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:mockRepository];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(1));
}

-(void)testEnumerateItemsUsingBlockRepository
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    [[[mockRepository expect] andReturn:mockItem] item];
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:mockRepository];
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

-(void)testEnumerateItemsUsingNilBlockRepository
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    [[[mockRepository expect] andReturn:mockItem] item];
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:mockRepository];

    //when, then
    [repository enumerateItemsUsingBlock:nil];
}

-(void)testFilteredArrayUsingPredicateRepository
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    [[[mockRepository expect] andReturn:mockItem] item];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    [[[mockPredicate expect] andReturnValue:@YES] evaluateWithObject:mockItem];
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:mockRepository];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    [mockPredicate verify];
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(1));
    assertThat(array[0], equalTo(mockItem));
}

-(void)testFilteredArrayUsingNilPredicateRepository
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    [[[mockRepository expect] andReturn:mockItem] item];
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:mockRepository];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:nil];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
}

-(void)testItemAtIndexRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemRepository)];
    id<ERNAsyncItemsRepository> repository =
    [ERNItemToAsyncItemsRepository createWithRepository:mockRepository];

    //when
    id<NSObject> item = [repository itemAtIndex:10];

    //then
    assertThat(item, notNilValue());
    assertThat([item class], equalTo([NSNull class]));
}
@end
