#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMergingAsyncItemsRepositoryTest.h"
#import "ERNMergingAsyncItemsRepository.h"

@interface ERNBaseAsyncRepository ()
-(void)testHelperChangeNotificationCenter:(NSNotificationCenter *)notificationCenter;
@end

@interface ERNMergingAsyncItemsRepository ()
-(void)subRepositoriesRefreshed;
@end

@implementation ERNMergingAsyncItemsRepositoryTest

-(void)subRepositoriesRefreshed
{
}

-(void)testSubRepositoriesUpdatedWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];

    //when
    [repository subRepositoriesRefreshed];

    //then
    [mockNotificationCenter verify];
}

-(void)testCountWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testLimitWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                              createWithFirstRepository:nil
                                              restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testOffsetWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger offset = [repository offset];
    
    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testRefreshWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
     [repository refresh];
    
    //then
    [mockNotificationCenter verify];
}

-(void)testItemAtIndexWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtIndex:10];
    
    //then
    assertThat(item, notNilValue());
    assertThat([item class], equalTo([[NSNull null] class]));
    [mockNotificationCenter verify];
}

-(void)testEnumerateItemsUsingNilBlockWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockNotificationCenter verify];
}

-(void)testEnumerateItemsUsingBlockWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    __block BOOL called = NO;

    //when
    [repository enumerateItemsUsingBlock:^(id<NSObject> item, NSUInteger index, BOOL *stop) {
        called = YES;
    }];

    //then
    assertThatBool(called, equalToBool(NO));
    [mockNotificationCenter verify];
}

-(void)testFilteredArrayUsingNilPredicateWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:nil];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testFilteredArrayUsingPredicateWithNilFirstNilRest
{
    //given
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
    [mockPredicate verify];
}

-(void)testSubRepositoriesUpdatedFirstNilRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];

    //when
    [repository subRepositoriesRefreshed];

    //then
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testCountWithFirstNilRest
{
    //given
    NSUInteger expectedCount = 4;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(expectedCount)] count];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedCount));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testLimitWithFirstNilRest
{
    //given
    NSUInteger expectedLimit = 5;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(expectedLimit)] limit];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(expectedLimit));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testOffsetWithFirstNilRest
{
    //given
    NSUInteger expectedOffset = 6;
    NSUInteger firstCount = 56;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(expectedOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(expectedOffset));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testRefreshWithFirstNilRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockFirstRepository expect] refresh];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository refresh];

    //then
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testItemAtIndexWithFirstNilRest
{
    //given
    NSUInteger firstCount = 20;
    NSUInteger requestedIndex = 10;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockFirstRepository expect] andReturn:mockItem] itemAtIndex:requestedIndex];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtIndex:requestedIndex];

    //then
    assertThat(item, equalTo(mockItem));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testItemAtIndexWithFirstNilRestOutOfBounds
{
    //given
    NSUInteger firstCount = 10;
    NSUInteger requestedIndex = 20;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtIndex:requestedIndex];

    //then
    assertThat([item class], equalTo([[NSNull null] class]));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testEnumerateItemsUsingNilBlockWithFirstNilRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testEnumerateItemsUsingBlockWithFirstNilRest
{
    //given
    ERNRepositoryEnumerationBlock block = ^(id<NSObject> item, NSUInteger index, BOOL *stop) {};
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockFirstRepository expect] enumerateItemsUsingBlock:block];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository enumerateItemsUsingBlock:block];

    //then
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testFilteredArrayUsingNilPredicateWithFirstNilRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:nil];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testFilteredArrayUsingPredicateWithFirstNilRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    [[mockFirstRepository expect] filteredArrayUsingPredicate:mockPredicate];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
    [mockPredicate verify];
    [mockFirstRepository verify];
}

-(void)testSubRepositoriesUpdatedNilFirstRest
{
    //given
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];

    //when
    [repository subRepositoriesRefreshed];

    //then
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testCountWithNilFirstRest
{
    //given
    NSUInteger expectedCount = 4;
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(expectedCount)] count];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedCount));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testLimitWithNilFirstRest
{
    //given
    NSUInteger expectedLimit = 5;
    NSUInteger restCount = 10;
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(expectedLimit)] limit];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(restCount)] count];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(expectedLimit));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testOffsetWithNilFirstRest
{
    //given
    NSUInteger expectedOffset = 6;
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(expectedOffset)] offset];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(expectedOffset));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testRefreshWithNilFirstRest
{
    //given
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockRestRepository expect] refresh];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository refresh];

    //then
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testItemAtIndexWithNilFirstRest
{
    //given
    NSUInteger requestedIndex = 10;
    NSUInteger restCount = 20;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(restCount)] count];
    [[[mockRestRepository expect] andReturn:mockItem] itemAtIndex:requestedIndex];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id item = [repository itemAtIndex:requestedIndex];

    //then
    assertThat(item, equalTo(mockItem));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testItemAtIndexWithNilFirstRestOutOfBounds
{
    //given
    NSUInteger restCount = 10;
    NSUInteger requestedIndex = 20;
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(restCount)] count];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtIndex:requestedIndex];

    //then
    assertThat([item class], equalTo([[NSNull null] class]));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testEnumerateItemsUsingNilBlockWithNilFirstRest
{
    //given
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testEnumerateItemsUsingBlockWithNilFirstRest
{
    //given
    ERNRepositoryEnumerationBlock block = ^(id<NSObject> item, NSUInteger index, BOOL *stop) {};
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockRestRepository expect] enumerateItemsUsingBlock:block];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository enumerateItemsUsingBlock:block];

    //then
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testFilteredArrayUsingNilPredicateWithNilFirstRest
{
    //given
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:nil];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testFilteredArrayUsingPredicateWithNilFirstRest
{
    //given
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    [[mockRestRepository expect] filteredArrayUsingPredicate:mockPredicate];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
    [mockPredicate verify];
    [mockRestRepository verify];
}

-(void)testSubRepositoriesUpdatedFirstRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY object:repository];

    //when
    [repository subRepositoriesRefreshed];

    //then
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testCountWithFirstRest
{
    //given
    NSUInteger expectedCount = 9;
    NSUInteger firstCount = 4;
    NSUInteger restCount = 5;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(restCount)] count];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedCount));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testCountWithEmptyFirstRest
{
    //given
    NSUInteger expectedCount = 5;
    NSUInteger firstCount = 0;
    NSUInteger restCount = 5;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(restCount)] count];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedCount));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testCountWithFirstEmptyRest
{
    //given
    NSUInteger expectedCount = 4;
    NSUInteger firstCount = 4;
    NSUInteger restCount = 0;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(restCount)] count];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedCount));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testLimitWithFirstRestEmptyFirst
{
    //given
    NSUInteger expectedLimit = 5;
    NSUInteger restCount = 10;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(expectedLimit)] limit];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(restCount)] count];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(expectedLimit));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testLimitWithFirstRestFullFirst
{
    //given
    NSUInteger firstCount = 4;
    NSUInteger firstLimit = 4;
    NSUInteger restLimit = 5;
    NSUInteger restCount = 87;
    NSUInteger expectedLimit = firstCount + restLimit;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstLimit)] limit];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(restLimit)] limit];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(restCount)] count];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(expectedLimit));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testLimitWithFirstRestNotFullFirst
{
    //given
    NSUInteger firstCount = 30;
    NSUInteger firstLimit = 12;
    NSUInteger firstOffset = 3;
    NSUInteger restCount = 1000;
    NSUInteger restLimit = 500;
    NSUInteger restOffset = 0;
    NSUInteger expectedLimit = restLimit + firstCount - firstOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstLimit)] limit];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restCount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restLimit)] limit];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restOffset)] offset];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(expectedLimit));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testLimitWithFirstRestNotFullFirstNotFullRest
{
    //given
    NSUInteger firstCount = 30;
    NSUInteger firstLimit = 12;
    NSUInteger firstOffset = 3;
    NSUInteger restCount = 1000;
    NSUInteger restLimit = 500;
    NSUInteger restOffset = 30;
    NSUInteger expectedLimit = restLimit + restOffset + firstCount - firstOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstLimit)] limit];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restCount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restLimit)] limit];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restOffset)] offset];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(expectedLimit));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testLimitWithFirstRestNotFullFirstEmptyRest
{
    //given
    NSUInteger firstCount = 30;
    NSUInteger firstLimit = 12;
    NSUInteger firstOffset = 3;
    NSUInteger restCount = 0;
    NSUInteger restLimit = 0;
    NSUInteger restOffset = 0;
    NSUInteger expectedLimit = firstLimit;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstLimit)] limit];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restCount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restLimit)] limit];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restOffset)] offset];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger limit = [repository limit];

    //then
    assertThatUnsignedInteger(limit, equalToUnsignedInteger(expectedLimit));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}


-(void)testOffsetWithFirstRest
{
    //given
    NSUInteger firstCount = 30;
    NSUInteger firstLimit = 12;
    NSUInteger firstOffset = 3;
    NSUInteger restCount = 233;
    NSUInteger restLimit = 23;
    NSUInteger restOffset = 4;
    NSUInteger expectedOffset = firstOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstLimit)] limit];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restCount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restLimit)] limit];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restOffset)] offset];

    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(expectedOffset));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testOffsetWithEmptyFirstRest
{
    //given
    NSUInteger firstCount = 0;
    NSUInteger firstLimit = 0;
    NSUInteger firstOffset = 0;
    NSUInteger restCount = 233;
    NSUInteger restLimit = 23;
    NSUInteger restOffset = 4;
    NSUInteger expectedOffset = restOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstLimit)] limit];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restCount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restLimit)] limit];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restOffset)] offset];

    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger offset = [repository offset];

    //then
    assertThatUnsignedInteger(offset, equalToUnsignedInteger(expectedOffset));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}


-(void)testRefreshWithFirstRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockFirstRepository expect] refresh];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockRestRepository expect] refresh];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository refresh];

    //then
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testItemAtIndexWithFirstRestInRest
{
    //given
    NSUInteger requestedIndex = 40;
    NSUInteger restCount = 20;
    NSUInteger firstCount = 30;
    NSUInteger expectedRestIndex = 10;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restCount)] count];
    [[[mockFirstRepository stub] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockRestRepository expect] andReturn:mockItem] itemAtIndex:expectedRestIndex];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id item = [repository itemAtIndex:requestedIndex];

    //then
    assertThat(item, equalTo(mockItem));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testItemAtIndexWithFirstRestInFirst
{
    //given
    NSUInteger requestedIndex = 23;
    NSUInteger restCount = 20;
    NSUInteger firstCount = 30;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restCount)] count];
    [[[mockFirstRepository stub] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockFirstRepository expect] andReturn:mockItem] itemAtIndex:requestedIndex];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id item = [repository itemAtIndex:requestedIndex];

    //then
    assertThat(item, equalTo(mockItem));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testItemAtIndexWithFirstRestOutOfBounds
{
    //given
    NSUInteger requestedIndex = 200;
    NSUInteger restCount = 20;
    NSUInteger firstCount = 30;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository stub] andReturnValue:OCMOCK_VALUE(firstCount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restCount)] count];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtIndex:requestedIndex];

    //then
    assertThat([item class], equalTo([[NSNull null] class]));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
    [mockRestRepository verify];
}

-(void)testEnumerateItemsUsingNilBlockWithFirstRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    //when
    [repository enumerateItemsUsingBlock:nil];

    //then
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testEnumerateItemsUsingBlockWithFirstRest
{
    //given
    ERNRepositoryEnumerationBlock block = ^(id<NSObject> item, NSUInteger index, BOOL *stop) {};
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[mockFirstRepository expect] enumerateItemsUsingBlock:block];
    [[mockRestRepository expect] enumerateItemsUsingBlock:block];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository enumerateItemsUsingBlock:block];

    //then
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testFilteredArrayUsingNilPredicateWithFirstRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:nil];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testFilteredArrayUsingPredicateWithFirstRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    [[mockFirstRepository expect] filteredArrayUsingPredicate:mockPredicate];
    [[mockRestRepository expect] filteredArrayUsingPredicate:mockPredicate];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *array = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(array, notNilValue());
    assertThatUnsignedInteger([array count], equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
    [mockPredicate verify];
    [mockRestRepository verify];
}

@end
