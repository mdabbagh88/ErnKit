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

-(void)testcountWithNilFirstNilRest
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

-(void)testItemAtTotalIndexWithNilFirstNilRest
{
    //given
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtTotalIndex:10];
    
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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

-(void)testcountWithFirstNilRest
{
    //given
    NSUInteger expectedcount = 5;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(expectedcount)] count];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedcount));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testOffsetWithFirstNilRest
{
    //given
    NSUInteger expectedOffset = 6;
    NSUInteger firsttotal = 56;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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

-(void)testItemAtTotalIndexWithFirstNilRest
{
    //given
    NSUInteger firsttotal = 20;
    NSUInteger requestedIndex = 10;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturn:mockItem] itemAtTotalIndex:requestedIndex];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtTotalIndex:requestedIndex];

    //then
    assertThat(item, equalTo(mockItem));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testItemAtTotalIndexWithFirstNilRestOutOfBounds
{
    //given
    NSUInteger firsttotal = 10;
    NSUInteger requestedIndex = 20;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtTotalIndex:requestedIndex];

    //then
    assertThat([item class], equalTo([[NSNull null] class]));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
}

-(void)testEnumerateItemsUsingNilBlockWithFirstNilRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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

-(void)testcountWithNilFirstRest
{
    //given
    NSUInteger expectedcount = 5;
    NSUInteger resttotal = 10;
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(expectedcount)] count];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedcount));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testOffsetWithNilFirstRest
{
    //given
    NSUInteger expectedOffset = 6;
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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

-(void)testItemAtTotalIndexWithNilFirstRest
{
    //given
    NSUInteger requestedIndex = 10;
    NSUInteger resttotal = 20;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockRestRepository expect] andReturn:mockItem] itemAtTotalIndex:requestedIndex];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id item = [repository itemAtTotalIndex:requestedIndex];

    //then
    assertThat(item, equalTo(mockItem));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testItemAtTotalIndexWithNilFirstRestOutOfBounds
{
    //given
    NSUInteger resttotal = 10;
    NSUInteger requestedIndex = 20;
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:nil
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtTotalIndex:requestedIndex];

    //then
    assertThat([item class], equalTo([[NSNull null] class]));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testEnumerateItemsUsingNilBlockWithNilFirstRest
{
    //given
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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

-(void)testcountWithFirstRestEmptyFirst
{
    //given
    NSUInteger expectedcount = 5;
    NSUInteger resttotal = 10;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(expectedcount)] count];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedcount));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testcountWithFirstRestFullFirst
{
    //given
    NSUInteger firsttotal = 4;
    NSUInteger firstcount = 4;
    NSUInteger restcount = 5;
    NSUInteger resttotal = 87;
    NSUInteger expectedcount = firsttotal + restcount;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstcount)] count];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(restcount)] count];
    [[[mockRestRepository expect] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedcount));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testcountWithFirstRestNotFullFirst
{
    //given
    NSUInteger firsttotal = 30;
    NSUInteger firstcount = 12;
    NSUInteger firstOffset = 3;
    NSUInteger resttotal = 1000;
    NSUInteger restcount = 500;
    NSUInteger restOffset = 0;
    NSUInteger expectedcount = restcount + firsttotal - firstOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstcount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restcount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restOffset)] offset];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedcount));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testcountWithFirstRestNotFullFirstNotFullRest
{
    //given
    NSUInteger firsttotal = 30;
    NSUInteger firstcount = 12;
    NSUInteger firstOffset = 3;
    NSUInteger resttotal = 1000;
    NSUInteger restcount = 500;
    NSUInteger restOffset = 30;
    NSUInteger expectedcount = restcount + restOffset + firsttotal - firstOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstcount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restcount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restOffset)] offset];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedcount));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testcountWithFirstRestNotFullFirstEmptyRest
{
    //given
    NSUInteger firsttotal = 30;
    NSUInteger firstcount = 12;
    NSUInteger firstOffset = 3;
    NSUInteger resttotal = 0;
    NSUInteger restcount = 0;
    NSUInteger restOffset = 0;
    NSUInteger expectedcount = firstcount;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstcount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restcount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restOffset)] offset];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedcount));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}


-(void)testOffsetWithFirstRest
{
    //given
    NSUInteger firsttotal = 30;
    NSUInteger firstcount = 12;
    NSUInteger firstOffset = 3;
    NSUInteger resttotal = 233;
    NSUInteger restcount = 23;
    NSUInteger restOffset = 4;
    NSUInteger expectedOffset = firstOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstcount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restcount)] count];
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
    NSUInteger firstcount = 0;
    NSUInteger firstOffset = 0;
    NSUInteger resttotal = 233;
    NSUInteger restcount = 23;
    NSUInteger restOffset = 4;
    NSUInteger expectedOffset = restOffset;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstOffset)] offset];
    [[[mockFirstRepository expect] andReturnValue:OCMOCK_VALUE(firstcount)] count];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(restcount)] count];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[mockFirstRepository expect] refresh];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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

-(void)testItemAtTotalIndexWithFirstRestInRest
{
    //given
    NSUInteger requestedIndex = 40;
    NSUInteger resttotal = 20;
    NSUInteger firsttotal = 30;
    NSUInteger expectedRestIndex = 10;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockFirstRepository stub] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockRestRepository expect] andReturn:mockItem] itemAtTotalIndex:expectedRestIndex];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id item = [repository itemAtTotalIndex:requestedIndex];

    //then
    assertThat(item, equalTo(mockItem));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testItemAtTotalIndexWithFirstRestInFirst
{
    //given
    NSUInteger requestedIndex = 23;
    NSUInteger resttotal = 20;
    NSUInteger firsttotal = 30;
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    [[[mockFirstRepository stub] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockFirstRepository expect] andReturn:mockItem] itemAtTotalIndex:requestedIndex];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id item = [repository itemAtTotalIndex:requestedIndex];

    //then
    assertThat(item, equalTo(mockItem));
    [mockNotificationCenter verify];
    [mockRestRepository verify];
}

-(void)testItemAtTotalIndexWithFirstRestOutOfBounds
{
    //given
    NSUInteger requestedIndex = 200;
    NSUInteger resttotal = 20;
    NSUInteger firsttotal = 30;
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [[[mockFirstRepository stub] andReturnValue:OCMOCK_VALUE(firsttotal)] total];
    [[[mockRestRepository stub] andReturnValue:OCMOCK_VALUE(resttotal)] total];
    ERNMergingAsyncItemsRepository *repository = [ERNMergingAsyncItemsRepository
                                                  createWithFirstRepository:mockFirstRepository
                                                  restRepository:mockRestRepository];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id<NSObject> item = [repository itemAtTotalIndex:requestedIndex];

    //then
    assertThat([item class], equalTo([[NSNull null] class]));
    [mockNotificationCenter verify];
    [mockFirstRepository verify];
    [mockRestRepository verify];
}

-(void)testEnumerateItemsUsingNilBlockWithFirstRest
{
    //given
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
    id mockFirstRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockRestRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
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
