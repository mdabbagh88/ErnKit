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

-(void)testTotalWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger total = [repository total];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(0));
    [mockNotificationCenter verify];
}

-(void)testFetchedWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                              createWithFirstRepository:nil
                                              restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger fetched = [repository fetched];

    //then
    assertThatUnsignedInteger(fetched, equalToUnsignedInteger(0));
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

-(void)testTotalWithFirstNilRest
{
    //given
    NSUInteger expectedtotal = 4;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(expectedtotal)] total];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger total = [repository total];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(expectedtotal));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testFetchedWithFirstNilRest
{
    //given
    NSUInteger expectedfetched = 5;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(expectedfetched)] fetched];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger fetched = [repository fetched];

    //then
    assertThatUnsignedInteger(fetched, equalToUnsignedInteger(expectedfetched));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testOffsetWithFirstNilRest
{
    //given
    NSUInteger expectedOffset = 6;
    NSUInteger firsttotal = 56;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(expectedOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
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
    NSUInteger firsttotal = 20;
    NSUInteger requestedIndex = 10;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
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
    NSUInteger firsttotal = 10;
    NSUInteger requestedIndex = 20;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
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

-(void)testTotalWithNilFirstRest
{
    //given
    NSUInteger expectedtotal = 4;
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(expectedtotal)] total];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger total = [repository total];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(expectedtotal));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testFetchedWithNilFirstRest
{
    //given
    NSUInteger expectedfetched = 5;
    NSUInteger resttotal = 10;
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(expectedfetched)] fetched];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger fetched = [repository fetched];

    //then
    assertThatUnsignedInteger(fetched, equalToUnsignedInteger(expectedfetched));
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
    NSUInteger resttotal = 20;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
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
    NSUInteger resttotal = 10;
    NSUInteger requestedIndex = 20;
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
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

-(void)testTotalWithFirstRest
{
    //given
    NSUInteger expectedtotal = 9;
    NSUInteger firsttotal = 4;
    NSUInteger resttotal = 5;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger total = [repository total];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(expectedtotal));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testTotalWithEmptyFirstRest
{
    //given
    NSUInteger expectedtotal = 5;
    NSUInteger firsttotal = 0;
    NSUInteger resttotal = 5;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger total = [repository total];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(expectedtotal));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testTotalWithFirstEmptyRest
{
    //given
    NSUInteger expectedtotal = 4;
    NSUInteger firsttotal = 4;
    NSUInteger resttotal = 0;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger total = [repository total];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(expectedtotal));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testFetchedWithFirstRestEmptyFirst
{
    //given
    NSUInteger expectedfetched = 5;
    NSUInteger resttotal = 10;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(expectedfetched)] fetched];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger fetched = [repository fetched];

    //then
    assertThatUnsignedInteger(fetched, equalToUnsignedInteger(expectedfetched));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testFetchedWithFirstRestFullFirst
{
    //given
    NSUInteger firsttotal = 4;
    NSUInteger firstfetched = 4;
    NSUInteger restfetched = 5;
    NSUInteger resttotal = 87;
    NSUInteger expectedfetched = firsttotal + restfetched;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstfetched)] fetched];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(restfetched)] fetched];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger fetched = [repository fetched];

    //then
    assertThatUnsignedInteger(fetched, equalToUnsignedInteger(expectedfetched));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testFetchedWithFirstRestNotFullFirst
{
    //given
    NSUInteger firsttotal = 30;
    NSUInteger firstfetched = 12;
    NSUInteger firstOffset = 3;
    NSUInteger resttotal = 1000;
    NSUInteger restfetched = 500;
    NSUInteger restOffset = 0;
    NSUInteger expectedfetched = restfetched + firsttotal - firstOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstfetched)] fetched];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restfetched)] fetched];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restOffset)] offset];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger fetched = [repository fetched];

    //then
    assertThatUnsignedInteger(fetched, equalToUnsignedInteger(expectedfetched));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testFetchedWithFirstRestNotFullFirstNotFullRest
{
    //given
    NSUInteger firsttotal = 30;
    NSUInteger firstfetched = 12;
    NSUInteger firstOffset = 3;
    NSUInteger resttotal = 1000;
    NSUInteger restfetched = 500;
    NSUInteger restOffset = 30;
    NSUInteger expectedfetched = restfetched + restOffset + firsttotal - firstOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstfetched)] fetched];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restfetched)] fetched];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restOffset)] offset];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger fetched = [repository fetched];

    //then
    assertThatUnsignedInteger(fetched, equalToUnsignedInteger(expectedfetched));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testFetchedWithFirstRestNotFullFirstEmptyRest
{
    //given
    NSUInteger firsttotal = 30;
    NSUInteger firstfetched = 12;
    NSUInteger firstOffset = 3;
    NSUInteger resttotal = 0;
    NSUInteger restfetched = 0;
    NSUInteger restOffset = 0;
    NSUInteger expectedfetched = firstfetched;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstfetched)] fetched];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restfetched)] fetched];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restOffset)] offset];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger fetched = [repository fetched];

    //then
    assertThatUnsignedInteger(fetched, equalToUnsignedInteger(expectedfetched));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}


-(void)testOffsetWithFirstRest
{
    //given
    NSUInteger firsttotal = 30;
    NSUInteger firstfetched = 12;
    NSUInteger firstOffset = 3;
    NSUInteger resttotal = 233;
    NSUInteger restfetched = 23;
    NSUInteger restOffset = 4;
    NSUInteger expectedOffset = firstOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstfetched)] fetched];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restfetched)] fetched];
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
    NSUInteger firsttotal = 0;
    NSUInteger firstfetched = 0;
    NSUInteger firstOffset = 0;
    NSUInteger resttotal = 233;
    NSUInteger restfetched = 23;
    NSUInteger restOffset = 4;
    NSUInteger expectedOffset = restOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstfetched)] fetched];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restfetched)] fetched];
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
    NSUInteger resttotal = 20;
    NSUInteger firsttotal = 30;
    NSUInteger expectedRestIndex = 10;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockFirstRepository stub] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
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
    NSUInteger resttotal = 20;
    NSUInteger firsttotal = 30;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockFirstRepository stub] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
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
    NSUInteger resttotal = 20;
    NSUInteger firsttotal = 30;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    [[[mockFirstRepository stub] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
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
