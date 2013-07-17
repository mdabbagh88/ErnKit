#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNArrayAsyncItemsRepositoryTest.h"
#import "ERNArrayAsyncItemsRepository.h"
#import "ERNAsyncItemsRepositoryTest.h"
#import "ERNMockObserver.h"

@implementation ERNArrayAsyncItemsRepositoryTest {
}

#pragma mark - ERNAsyncItemsRepository protocol tests

-(void)testAsyncItemsRepositoryProtocolWithNilArray
{
    [ERNAsyncItemsRepositoryTest testAsyncItemsRepository:
     [ERNArrayAsyncItemsRepository createWithArray:nil]];
}

-(void)testAsyncItemsRepositoryProtocolWithArray
{
    [ERNAsyncItemsRepositoryTest testAsyncItemsRepository:
     [ERNArrayAsyncItemsRepository createWithArray:@[@"a", @"b"]]];
}

-(void)testAsyncItemsRepositoryProtocolWithNilArrayAndSetArray
{
    ERNArrayAsyncItemsRepository *repository =
    [ERNArrayAsyncItemsRepository createWithArray:nil];
    [repository setArray:@[@"a", @"b"]];
    [ERNAsyncItemsRepositoryTest testAsyncItemsRepository:repository];
}

-(void)testAsyncItemsRepositoryProtocolWithNilArrayAndSetNilArray
{
    ERNArrayAsyncItemsRepository *repository =
    [ERNArrayAsyncItemsRepository createWithArray:nil];
    [repository setArray:nil];
    [ERNAsyncItemsRepositoryTest testAsyncItemsRepository:repository];
}

-(void)testAsyncItemsRepositoryProtocolWithArrayAndSetArray
{
    ERNArrayAsyncItemsRepository *repository =
    [ERNArrayAsyncItemsRepository createWithArray:@[@"a", @"b"]];
    [repository setArray:@[@"c", @"d"]];
    [ERNAsyncItemsRepositoryTest testAsyncItemsRepository:repository];
}

-(void)testAsyncItemsRepositoryProtocolWithArrayAndSetNilArray
{
    ERNArrayAsyncItemsRepository *repository =
    [ERNArrayAsyncItemsRepository createWithArray:@[@"a", @"b"]];
    [repository setArray:nil];
    [ERNAsyncItemsRepositoryTest testAsyncItemsRepository:repository];
}

#pragma mark - class tests

-(void)testSetArrayNilArray
{
    //given
    NSArray *expectedArray = @[@"one", @"two"];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:nil];

    //when
    [repository setArray:expectedArray];

    //then
    assertThat([repository array], equalTo(expectedArray));
}

-(void)testSetArrayArray
{
    //given
    NSArray *initArray = @[@"one", @"two"];
    NSArray *expectedArray = @[@"three", @"four"];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:initArray];

    //when
    [repository setArray:expectedArray];

    //then
    assertThat([repository array], equalTo(expectedArray));
}

-(void)testSetArrayNilArrayObserving
{
    //given
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:nil];
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [[mockObserver expect] dummyMethodForSelector];
    [repository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];

    //when
    [repository setArray:@[@"one", @"two"]];

    //then
    [mockObserver verify];
    [repository removeObserver:mockObserver];
}

-(void)testSetArrayArrayObserving
{
    //given
    ERNArrayAsyncItemsRepository *repository =
    [ERNArrayAsyncItemsRepository createWithArray:@[@"one", @"two"]];
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [[mockObserver expect] dummyMethodForSelector];
    [repository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];

    //when
    [repository setArray:@[@"three", @"four"]];

    //then
    [mockObserver verify];
    [repository removeObserver:mockObserver];
}

-(void)testCountArray
{
    NSArray *initArray = @[@"one", @"two"];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:initArray];

    assertThat(repository, hasCountOf([initArray count]));
}

-(void)testItemAtIndexOutOfIndexArray
{
    //given
    NSArray *initArray = @[@"one", @"two"];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:initArray];

    //when
    id item = [repository itemAtIndex:12];

    //then
    assertThat(item, instanceOf([NSNull class]));
}

-(void)testItemAtIndexArray
{
    //given
    NSString *expectedItemAtIndexOne = @"two";
    NSArray *initArray = @[@"one", expectedItemAtIndexOne];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:initArray];

    //when
    id item = [repository itemAtIndex:1];

    //then
    assertThat(item, equalTo(expectedItemAtIndexOne));
}

-(void)testEnumerateItemsUsingBlockArray
{
    //given
    ERNRepositoryEnumerationBlock block = ^(id<NSObject> item, NSUInteger index, BOOL *stop) {};
    id mockArray = [OCMockObject mockForClass:[NSArray class]];
    [(NSArray *)[mockArray expect] enumerateObjectsUsingBlock:block];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:mockArray];

    //when
    [repository enumerateItemsUsingBlock:block];

    //then
    [mockArray verify];
}

-(void)testFilteredArrayUsingPredicateArray
{
    //given
    id mockArray = [OCMockObject mockForClass:[NSArray class]];
    id mockInitArray = [OCMockObject mockForClass:[NSArray class]];
    id mockPredicate = [OCMockObject mockForClass:[NSPredicate class]];
    [[[mockInitArray expect] andReturn:mockArray] filteredArrayUsingPredicate:mockPredicate];
    ERNArrayAsyncItemsRepository *repository = [ERNArrayAsyncItemsRepository createWithArray:mockInitArray];

    //when
    NSArray *filteredItems = [repository filteredArrayUsingPredicate:mockPredicate];

    //then
    assertThat(filteredItems, equalTo(mockArray));
}

-(void)dummyMethodForSelector
{
}

@end
