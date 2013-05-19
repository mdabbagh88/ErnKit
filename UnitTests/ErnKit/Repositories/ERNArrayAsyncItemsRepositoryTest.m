#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNArrayAsyncItemsRepositoryTest.h"
#import "ERNArrayAsyncItemsRepository.h"

@interface ERNBaseAsyncRepository (ErnTestHelper)
-(void)testHelperChangeNotificationCenter:(NSNotificationCenter *)notificationCenter;
@end

@implementation ERNArrayAsyncItemsRepositoryTest

-(void)testSetArrayNilArray
{
    //given
    NSArray *expectedArray = @[@"one", @"two"];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:nil];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY
                                                   object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setArray:expectedArray];

    //then
    assertThat([repository array], equalTo(expectedArray));
    [mockNotificationCenter verify];
}

-(void)testTotalNilArray
{
    //given
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:nil];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    [mockNotificationCenter verify];
    assertThatUnsignedInteger(count, equalToUnsignedInteger(0));
}

-(void)testItemAtIndexNilArray
{
    //given
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:nil];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id item = [repository itemAtIndex:12];

    //then
    [mockNotificationCenter verify];
    assertThat([item class], equalTo([NSNull class]));
}

-(void)testEnumerateItemsUsingBlockNilArray
{
    //given
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:nil];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    __block BOOL called = NO;

    //when
    [repository enumerateItemsUsingBlock:^(id<NSObject> item, NSUInteger index, BOOL *stop) {
        called = YES;
    }];

    //then
    [mockNotificationCenter verify];
    assertThatBool(called, equalToBool(NO));
}

-(void)testFilteredArrayUsingPredicateNilArray
{
    //given
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:nil];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];
    __block BOOL called = NO;

    //when
    NSArray *filteredItems = [repository filteredArrayUsingPredicate:
                              [NSPredicate predicateWithBlock:
                               ^BOOL(id evaluatedObject, NSDictionary *bindings) {
                                   called = YES;
                                   return NO;
                               }]];

    //then
    [mockNotificationCenter verify];
    assertThatBool(called, equalToBool(NO));
    assertThat(filteredItems, equalTo(@[]));
}

-(void)testSetArrayArray
{
    //given
    NSArray *initArray = @[@"one", @"two"];
    NSArray *expectedArray = @[@"three", @"four"];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:initArray];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY
                                                   object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository setArray:expectedArray];

    //then
    assertThat([repository array], equalTo(expectedArray));
    [mockNotificationCenter verify];
}

-(void)testTotalArray
{
    //given
    NSArray *initArray = @[@"one", @"two"];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:initArray];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSUInteger count = [repository count];

    //then
    [mockNotificationCenter verify];
    assertThatUnsignedInteger(count, equalToUnsignedInteger([initArray count]));
}

-(void)testItemAtIndexOutOfIndexArray
{
    //given
    NSArray *initArray = @[@"one", @"two"];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:initArray];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id item = [repository itemAtIndex:12];

    //then
    [mockNotificationCenter verify];
    assertThat([item class], equalTo([NSNull class]));
}

-(void)testItemAtIndexArray
{
    //given
    NSString *expectedItemAtIndexOne = @"two";
    NSArray *initArray = @[@"one", expectedItemAtIndexOne];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:initArray];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    id item = [repository itemAtIndex:1];

    //then
    [mockNotificationCenter verify];
    assertThat(item, equalTo(expectedItemAtIndexOne));
}

-(void)testEnumerateItemsUsingBlockArray
{
    //given
    ERNRepositoryEnumerationBlock block = ^(id<NSObject> item, NSUInteger index, BOOL *stop) {};
    id mockArray = [OCMockObject mockForClass:[NSArray class]];
    [(NSArray *)[mockArray expect] enumerateObjectsUsingBlock:block];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:mockArray];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository enumerateItemsUsingBlock:block];

    //then
    [mockNotificationCenter verify];
    [mockArray verify];
}

-(void)testFilteredArrayUsingPredicateArray
{
    //given
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    id mockArray = [OCMockObject mockForClass:[NSArray class]];
    id mockInitArray = [OCMockObject mockForClass:[NSArray class]];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    [[[mockInitArray expect] andReturn:mockArray] filteredArrayUsingPredicate:mockPredicate];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:mockInitArray];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    NSArray *filteredItems = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(filteredItems, equalTo(mockArray));
}

@end
