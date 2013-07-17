#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNTogglingAsyncPaginatedItemsRepositoryTest.h"
#import "ERNTogglingAsyncPaginatedItemsRepository.h"
#import "ERNToggler.h"
#import "ERNTogglerTest.h"
#import "ERNAsyncPaginatedItemsRepositoryTest.h"
#import "ERNMockObserver.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"

@interface ERNTogglingAsyncPaginatedItemsRepository ()
-(void)currentRepositoryRefreshed;
@end

@implementation ERNTogglingAsyncPaginatedItemsRepositoryTest {
}

#pragma mark - ERNToggler protocol tests

-(void)testTogglerProtocolWithNilRepositories
{
    [ERNTogglerTest testToggler:[ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:nil]];
}

-(void)testTogglerProtocolWithRepositories
{
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [ERNTogglerTest testToggler:
     [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:
      @[mockRepository, mockRepository]]];
}

#pragma mark - ERNAsyncPaginatedItemsRepository protocol tests

-(void)testAsyncPaginatedItemsRepositoryProtocolWithNilRepositories
{
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:nil]];
}

-(void)testAsyncPaginatedItemsRepositoryProtocolWithRepositories
{
    id<ERNAsyncPaginatedItemsRepository> mockRepository =
    [ERNNullAsyncPaginatedItemsRepository create];
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:
      @[mockRepository, mockRepository]]];
}

#pragma mark - class tests

-(void)testSetSelectedIndexObserving
{
    //given
    NSUInteger expectedIndex = 5;
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [[mockObserver expect] dummyMethodForSelector];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:nil];
    [repository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];

    //when
    [repository setSelectedIndex:expectedIndex];

    //then
    [mockObserver verify];
}

-(void)testRefreshRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] refresh];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository2 expect] refresh];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository refresh];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesRefresh
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] refresh];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository2 expect] refresh];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    [repository refresh];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testTotalRepositories
{
    //given
    NSUInteger expectedtotal = 4;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository1 expect] andReturnValue:OCMOCK_VALUE(expectedtotal)] total];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    NSUInteger total = [repository total];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    assertThatUnsignedInteger(total, equalToUnsignedInteger(expectedtotal));
}

-(void)testToggleWithRepositoriesTotalOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:5];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    assertThatUnsignedInteger([repository total], equalToUnsignedInteger(0));
}

-(void)testToggleWithRepositoriesTotal
{
    //given
    NSUInteger expectedtotal = 4;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository2 expect] andReturnValue:OCMOCK_VALUE(expectedtotal)] total];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];

    //then
    assertThatUnsignedInteger([repository total], equalToUnsignedInteger(expectedtotal));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testFetchedRepositories
{
    //given
    NSUInteger expectedfetched = 3;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository1 expect] andReturnValue:OCMOCK_VALUE(expectedfetched)] count];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedfetched));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesFetched
{
    //given
    NSUInteger expectedfetched = 3;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository2 expect] andReturnValue:OCMOCK_VALUE(expectedfetched)] count];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];

    //then
    assertThat(repository, hasCountOf(expectedfetched));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesfetchedOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThat(repository, isEmpty());
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testOffsetRepositories
{
    //given
    NSUInteger expectedOffset = 4;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository1 expect] andReturnValue:OCMOCK_VALUE(expectedOffset)] offset];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(expectedOffset));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesOffset
{
    //given
    NSUInteger expectedOffset = 4;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository2 expect] andReturnValue:OCMOCK_VALUE(expectedOffset)] offset];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];

    //then
    assertThatUnsignedInteger([repository offset], equalToUnsignedInteger(expectedOffset));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesOffsetOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThatUnsignedInteger([repository offset], equalToUnsignedInteger(0));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testItemAtIndexRepositories
{
    //given
    NSUInteger expectedIndex = 5;
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository1 expect] andReturn:mockObject] itemAtIndex:expectedIndex];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    id<NSObject> item = [repository itemAtIndex:expectedIndex];

    //then
    assertThat(item, equalTo(mockObject));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesItemAtIndex
{
    //given
    NSUInteger expectedIndex = 5;
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository2 expect] andReturn:mockObject] itemAtIndex:expectedIndex];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];

    //then
    assertThat([repository itemAtIndex:expectedIndex], equalTo(mockObject));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesItemAtIndexOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThat([repository itemAtIndex:5], instanceOf([NSNull class]));
    [mockRepository1 verify];
    [mockRepository2 verify];
}


-(void)testFilteredArrayUsingNilPredicateRepositories
{
    //given
    NSArray *expectedArray = @[];
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:nil];

    //then
    assertThat(array, equalTo(expectedArray));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesFilteredArrayUsingNilPredicateOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThatUnsignedInteger([[repository filteredArrayUsingPredicate:nil] count],
                              equalToUnsignedInteger(0));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesFilteredArrayUsingNilPredicate
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];

    //then
    assertThatUnsignedInteger([[repository filteredArrayUsingPredicate:nil] count],
                              equalToUnsignedInteger(0));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testFilteredArrayUsingPredicateRepositories
{
    //given
    NSArray *expectedArray = @[@"one", @"two"];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository1 expect] andReturn:expectedArray] filteredArrayUsingPredicate:mockPredicate];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(array, equalTo(expectedArray));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesFilteredArrayUsingPredicateOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:5];
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(array, isEmpty());
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesFilteredArrayUsingPredicate
{
    //given
    NSArray *expectedArray = @[@"one", @"two"];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository2 expect] andReturn:expectedArray] filteredArrayUsingPredicate:mockPredicate];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(array, equalTo(expectedArray));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testEnumeratItemsUsingBlockRepositories
{
    //given
    ERNRepositoryEnumerationBlock expectedBlock =
    ^(id<NSObject> item, NSUInteger index, BOOL *stop) {};
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect]  enumerateItemsUsingBlock:expectedBlock];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository enumerateItemsUsingBlock:expectedBlock];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesEnumerateItemsUsingBlockOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];
    __block BOOL called = NO;

    //when
    [repository setSelectedIndex:5];
    [repository enumerateItemsUsingBlock:
     ^(id<NSObject> item, NSUInteger index, BOOL *stop) {
         called = YES;
     }];

    //then
    assertThatBool(called, equalToBool(NO));
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesEnumerateItemsUsingBlock
{
    //given
    ERNRepositoryEnumerationBlock expectedBlock =
    ^(id<NSObject> item, NSUInteger index, BOOL *stop) {};
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository2 expect]  enumerateItemsUsingBlock:expectedBlock];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    [repository enumerateItemsUsingBlock:expectedBlock];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testEnumeratItemsUsingNilBlockRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesEnumerateItemsUsingNilBlockOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:5];
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesEnumerateItemsUsingNilBlock
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testFetchNextRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] fetchNext];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository fetchNext];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesFetchNext
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository2 expect] fetchNext];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    [repository fetchNext];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testFetchPreviousRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] fetchPrevious];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository fetchPrevious];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesFetchPrevious
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository2 expect] fetchPrevious];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    [repository fetchPrevious];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testHasPreviousRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] hasPrevious];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository hasPrevious];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesHasPrevious
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository2 expect] hasPrevious];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    [repository hasPrevious];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testHasNextRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] hasNext];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository hasNext];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesHasNext
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository2 expect] hasNext];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    [repository hasNext];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)dummyMethodForSelector
{
}

@end
