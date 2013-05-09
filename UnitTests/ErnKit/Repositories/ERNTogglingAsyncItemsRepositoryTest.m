#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNTogglingAsyncItemsRepositoryTest.h"
#import "ERNTogglingAsyncItemsRepository.h"

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
    [repository toggleToIndex:5];
    [repository refresh];

    //then
    [mockNotificationCenter verify];
}

-(void)testCountNilRepositories
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

-(void)testToggleWithNilRepositoriesCount
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:5];

    //then
    assertThatUnsignedInteger([repository count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testLimitNilRepositories
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testToggleWithNilRepositoriesLimit
{
    //given
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:5];

    //then
    assertThatUnsignedInteger([repository limit], equalToUnsignedInteger(0));
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
    [repository toggleToIndex:5];

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
    [repository toggleToIndex:5];

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
    [repository toggleToIndex:5];

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
    [repository toggleToIndex:5];

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
    [repository toggleToIndex:5];
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
    [repository toggleToIndex:5];
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockNotificationCenter verify];
}





-(void)testRefreshRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockRepository1 expect] refresh];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockRepository1 expect] refresh];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockRepository2 expect] refresh];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:1];
    [repository refresh];

    //then
    [mockNotificationCenter verify];
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testToggleWithRepositoriesRefreshOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockRepository1 expect] refresh];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockRepository2 expect] refresh];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:5];
    [repository refresh];

    //then
    [mockNotificationCenter verify];
    [mockRepository1 verify];
    [mockRepository2 verify];
}

-(void)testCountRepositories
{
    //given
    NSUInteger expectedCount = 4;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRepository1 expect] andReturnValue:OCMOCK_VALUE(expectedCount)] count];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedCount));
}

-(void)testToggleWithRepositoriesCountOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:5];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
    assertThatUnsignedInteger([repository count], equalToUnsignedInteger(0));
}

-(void)testToggleWithRepositoriesCount
{
    //given
    NSUInteger expectedCount = 4;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRepository2 expect] andReturnValue:OCMOCK_VALUE(expectedCount)] count];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:1];

    //then
    assertThatUnsignedInteger([repository count], equalToUnsignedInteger(expectedCount));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testLimitRepositories
{
    //given
    NSUInteger expectedLimit = 3;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRepository1 expect] andReturnValue:OCMOCK_VALUE(expectedLimit)] limit];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(expectedLimit));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesLimit
{
    //given
    NSUInteger expectedLimit = 3;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRepository2 expect] andReturnValue:OCMOCK_VALUE(expectedLimit)] limit];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:1];

    //then
    assertThatUnsignedInteger([repository limit], equalToUnsignedInteger(expectedLimit));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesLimitOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:5];

    //then
    assertThatUnsignedInteger([repository limit], equalToUnsignedInteger(0));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testOffsetRepositories
{
    //given
    NSUInteger expectedOffset = 4;
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRepository1 expect] andReturnValue:OCMOCK_VALUE(expectedOffset)] offset];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRepository2 expect] andReturnValue:OCMOCK_VALUE(expectedOffset)] offset];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:1];

    //then
    assertThatUnsignedInteger([repository offset], equalToUnsignedInteger(expectedOffset));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesOffsetOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:5];

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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRepository1 expect] andReturn:mockObject] itemAtIndex:expectedIndex];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRepository2 expect] andReturn:mockObject] itemAtIndex:expectedIndex];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:1];

    //then
    assertThat([repository itemAtIndex:expectedIndex], equalTo(mockObject));
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesItemAtIndexOutOfBounds
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:5];

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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:5];

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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:1];

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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRepository1 expect] andReturn:expectedArray] filteredArrayUsingPredicate:mockPredicate];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:5];
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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRepository2 expect] andReturn:expectedArray] filteredArrayUsingPredicate:mockPredicate];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:1];
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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    __block BOOL called = NO;

    //when
    [repository toggleToIndex:5];
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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockRepository2 expect]  enumerateItemsUsingBlock:expectedBlock];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:1];
    [repository enumerateItemsUsingBlock:expectedBlock];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testEnumeratItemsUsingNilBlockRepositories
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
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
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject mockForProtocol:@protocol(ERNAsyncItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:5];
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

-(void)testToggleWithRepositoriesEnumerateItemsUsingNilBlock
{
    //given
    id mockRepository1 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRepository2 = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    NSArray *repositories = @[mockRepository1, mockRepository2];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository toggleToIndex:1];
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockRepository1 verify];
    [mockRepository2 verify];
    [mockNotificationCenter verify];
}

@end