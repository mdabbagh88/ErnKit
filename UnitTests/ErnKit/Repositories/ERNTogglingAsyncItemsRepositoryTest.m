#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNTogglingAsyncItemsRepositoryTest.h"
#import "ERNTogglingAsyncItemsRepository.h"
#import "ERNToggler.h"

@interface ERNBaseAsyncRepository ()
-(void)testHelperChangeNotificationCenter:(NSNotificationCenter *)notificationCenter;
@end

@interface ERNTogglingAsyncItemsRepository ()
-(void)currentRepositoryRefreshed;
@end

@implementation ERNTogglingAsyncItemsRepositoryTest

-(void)testCurrentRepositoryRefreshedNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];

    //when
    [repository currentRepositoryRefreshed];

    //then
    [mockNotificationCenter verify];
}

-(void)testSelectedIndex
{
    //given
    NSUInteger expectedIndex = 5;
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:expectedIndex];

    //then
    [mockNotificationCenter verify];
    assertThatUnsignedInteger([repository selectedIndex], equalToUnsignedInteger(expectedIndex));

}

-(void)testRefreshNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository refresh];

    //then
    [mockNotificationCenter verify];
}

-(void)testToggleWithNilRepositoriesRefresh
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];
    [repository refresh];

    //then
    [mockNotificationCenter verify];
}

-(void)testTotalNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger total = [repository total];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testToggleWithNilRepositoriestotal
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThatUnsignedInteger([repository total], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testFetchedNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testToggleWithNilRepositoriesfetched
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThatUnsignedInteger([repository count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testOffsetNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testToggleWithNilRepositoriesOffset
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThatUnsignedInteger([repository offset], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testItemAtIndexNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtIndex:5];

    //then
    assertThat([item class], equalTo([[NSNull null] class]));
    [mockNotificationCenter verify];
}

-(void)testToggleWithNilRepositoriesItemAtIndex
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThat([[repository itemAtIndex:5] class], equalTo([[NSNull null] class]));
    [mockNotificationCenter verify];
}

-(void)testFilteredArrayUsingNilPredicateNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:nil];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testToggleWithNilRepositoriesFilteredArrayUsingNilPredicate
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThatUnsignedInteger([[repository filteredArrayUsingPredicate:nil] count],
                              equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testFilteredArrayUsingPredicateNilRepositories
{
    //given
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testToggleWithNilRepositoriesFilteredArrayUsingPredicate
{
    //given
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThatUnsignedInteger([[repository filteredArrayUsingPredicate:mockPredicate] count],
                              equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testEnumeratItemsUsingBlockNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    __block BOOL called = NO;

    //when
    [repository enumerateItemsUsingBlock:
     ^(id<NSObject> item, NSUInteger index, BOOL *stop) {
         called = YES;
    }];

    //then
    assertThatBool(called, equalToBool(NO));
    [mockNotificationCenter verify];
}

-(void)testToggleWithNilRepositoriesEnumerateItemsUsingBlock
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    __block BOOL called = NO;

    //when
    [repository setSelectedIndex:5];
    [repository enumerateItemsUsingBlock:
     ^(id<NSObject> item, NSUInteger index, BOOL *stop) {
         called = YES;
     }];
    
    //then
    assertThatBool(called, equalToBool(NO));
    [mockNotificationCenter verify];
}

-(void)testEnumeratItemsUsingNilBlockNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockNotificationCenter verify];
}

-(void)testToggleWithNilRepositoriesEnumerateItemsUsingNilBlock
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockNotificationCenter verify];
}

-(void)testRefreshRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] refresh];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository2 expect] refresh];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository refresh];

    //then
    [mockNotificationCenter verify];
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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:1];
    [repository refresh];

    //then
    [mockNotificationCenter verify];
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesRefreshOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] refresh];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository2 expect] refresh];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];
    [repository refresh];

    //then
    [mockNotificationCenter verify];
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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger total = [repository total];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
    assertThatUnsignedInteger(total, equalToUnsignedInteger(expectedtotal));
}

-(void)testToggleWithRepositoriestotalOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
    assertThatUnsignedInteger([repository total], equalToUnsignedInteger(0));
}

-(void)testToggleWithRepositoriestotal
{
    //given
    NSUInteger expectedtotal = 4;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository2 expect] andReturnValue:OCMOCK_VALUE(expectedtotal)] total];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:1];

    //then
    assertThatUnsignedInteger([repository total], equalToUnsignedInteger(expectedtotal));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testFetchedRepositories
{
    //given
    NSUInteger expectedfetched = 3;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository1 expect] andReturnValue:OCMOCK_VALUE(expectedfetched)] count];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedfetched));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesfetched
{
    //given
    NSUInteger expectedfetched = 3;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository2 expect] andReturnValue:OCMOCK_VALUE(expectedfetched)] count];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:1];

    //then
    assertThatUnsignedInteger([repository count], equalToUnsignedInteger(expectedfetched));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesfetchedOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThatUnsignedInteger([repository count], equalToUnsignedInteger(0));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testOffsetRepositories
{
    //given
    NSUInteger expectedOffset = 4;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository1 expect] andReturnValue:OCMOCK_VALUE(expectedOffset)] offset];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(expectedOffset));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesOffset
{
    //given
    NSUInteger expectedOffset = 4;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRepository2 expect] andReturnValue:OCMOCK_VALUE(expectedOffset)] offset];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:1];

    //then
    assertThatUnsignedInteger([repository offset], equalToUnsignedInteger(expectedOffset));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesOffsetOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThatUnsignedInteger([repository offset], equalToUnsignedInteger(0));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtIndex:expectedIndex];

    //then
    assertThat(item, equalTo(mockObject));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:1];

    //then
    assertThat([repository itemAtIndex:expectedIndex], equalTo(mockObject));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesItemAtIndexOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThat([[repository itemAtIndex:5] class], equalTo([[NSNull null] class]));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}


-(void)testFilteredArrayUsingNilPredicateRepositories
{
    //given
    NSArray *expectedArray = @[];
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:nil];

    //then
    assertThat(array, equalTo(expectedArray));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesFilteredArrayUsingNilPredicateOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];

    //then
    assertThatUnsignedInteger([[repository filteredArrayUsingPredicate:nil] count],
                              equalToUnsignedInteger(0));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesFilteredArrayUsingNilPredicate
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:1];

    //then
    assertThatUnsignedInteger([[repository filteredArrayUsingPredicate:nil] count],
                              equalToUnsignedInteger(0));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(array, equalTo(expectedArray));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesFilteredArrayUsingPredicateOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:1];
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(array, equalTo(expectedArray));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository enumerateItemsUsingBlock:expectedBlock];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesEnumerateItemsUsingBlockOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
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
    [mockNotificationCenter verify];
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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:1];
    [repository enumerateItemsUsingBlock:expectedBlock];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testEnumeratItemsUsingNilBlockRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesEnumerateItemsUsingNilBlockOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:5];
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesEnumerateItemsUsingNilBlock
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setSelectedIndex:1];
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testFetchNextNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];

    //when, then
    [repository fetchNext];
}

-(void)testToggleWithNilRepositoriesFetchNext
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];

    //when, then
    [repository setSelectedIndex:5];
    [repository fetchNext];
}

-(void)testFetchNextRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] fetchNext];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];

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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    [repository fetchNext];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testFetchPreviousNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];

    //when, then
    [repository fetchPrevious];
}

-(void)testToggleWithNilRepositoriesFetchPrevious
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];

    //when, then
    [repository setSelectedIndex:5];
    [repository fetchPrevious];
}

-(void)testFetchPreviousRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] fetchPrevious];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];

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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    [repository fetchPrevious];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testHasPreviousNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];

    //when, then
    [repository hasPrevious];
}

-(void)testToggleWithNilRepositoriesHasPrevious
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];

    //when, then
    [repository setSelectedIndex:5];
    [repository hasPrevious];
}

-(void)testHasPreviousRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] hasPrevious];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];

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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    [repository hasPrevious];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testHasNextNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];

    //when, then
    [repository hasNext];
}

-(void)testToggleWithNilRepositoriesHasNext
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];

    //when, then
    [repository setSelectedIndex:5];
    [repository hasNext];
}

-(void)testHasNextRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockRepository1 expect] hasNext];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];

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
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];

    //when
    [repository setSelectedIndex:1];
    [repository hasNext];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
}

@end
