#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNAsyncItemsRepositoryTest.h"
#import "ERNAsyncItemRepositoryTest.h"
#import "ERNMockObserver.h"

@implementation ERNAsyncItemsRepositoryTest {
}

#pragma mark - ERNAsyncItemsRepository protocol tests

+(void)testAsyncItemsRepository:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    [ERNAsyncItemRepositoryTest testAsyncItemRepository:asyncItemsRepository];
    [self testCount:asyncItemsRepository];
    [self testCountNotObserving:asyncItemsRepository];
    [self testItemAtIndexZero:asyncItemsRepository];
    [self testItemAtIndexZeroNotObserving:asyncItemsRepository];
    [self testItemAtIndexValue:asyncItemsRepository];
    [self testItemAtIndexValueNotObserving:asyncItemsRepository];
    [self testItemAtIndexMaxUnsignedInteger:asyncItemsRepository];
    [self testItemAtIndexMaxUnsignedIntegerNotObserving:asyncItemsRepository];
    [self testEnumerateItemsUsingNilBlock:asyncItemsRepository];
    [self testEnumerateItemsUsingBlock:asyncItemsRepository];
    [self testEnumerateItemsUsingNilBlockNotObserving:asyncItemsRepository];
    [self testEnumerateItemsUsingBlockNotObserving:asyncItemsRepository];
    [self testFilteredArrayUsingNilPredicate:asyncItemsRepository];
    [self testFilteredArrayUsingNilPredicateNotObserving:asyncItemsRepository];
    [self testFilteredArrayUsingPredicate:asyncItemsRepository];
    [self testFilteredArrayUsingPredicateNotObserving:asyncItemsRepository];
}

+(void)testCount:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    [asyncItemsRepository count];
}

+(void)testCountNotObserving:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncItemsRepository count];
    [mockObserver verify];
    [asyncItemsRepository removeObserver:mockObserver];
}

+(void)testItemAtIndexZero:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    id item = [asyncItemsRepository itemAtIndex:0];

    assertThat(item, notNilValue());
}

+(void)testItemAtIndexZeroNotObserving:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncItemsRepository itemAtIndex:0];
    [mockObserver verify];
    [asyncItemsRepository removeObserver:mockObserver];
}

+(void)testItemAtIndexValue:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    id item = [asyncItemsRepository itemAtIndex:1];

    assertThat(item, notNilValue());
}

+(void)testItemAtIndexValueNotObserving:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncItemsRepository itemAtIndex:1];
    [mockObserver verify];
    [asyncItemsRepository removeObserver:mockObserver];
}

+(void)testItemAtIndexMaxUnsignedInteger:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    id item = [asyncItemsRepository itemAtIndex:UINT_MAX];

    assertThat(item, notNilValue());
}

+(void)testItemAtIndexMaxUnsignedIntegerNotObserving:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncItemsRepository itemAtIndex:UINT_MAX];
    [mockObserver verify];
    [asyncItemsRepository removeObserver:mockObserver];
}

+(void)testEnumerateItemsUsingNilBlock:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    [asyncItemsRepository enumerateItemsUsingBlock:nil];
}

+(void)testEnumerateItemsUsingNilBlockNotObserving:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncItemsRepository enumerateItemsUsingBlock:nil];
    [mockObserver verify];
    [asyncItemsRepository removeObserver:mockObserver];
}

+(void)testEnumerateItemsUsingBlock:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    [asyncItemsRepository enumerateItemsUsingBlock:
     ^(id<NSObject> item, NSUInteger index, BOOL *stop) {
    }];
}

+(void)testEnumerateItemsUsingBlockNotObserving:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncItemsRepository enumerateItemsUsingBlock:
     ^(id<NSObject> item, NSUInteger index, BOOL *stop) {
    }];
    [mockObserver verify];
    [asyncItemsRepository removeObserver:mockObserver];
}

+(void)testFilteredArrayUsingNilPredicate:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    NSUInteger expectedCount = 0;
    NSArray *filteredArray = [asyncItemsRepository filteredArrayUsingPredicate:nil];
    assertThat(filteredArray, notNilValue());
    assertThat(filteredArray, isEmpty());
}

+(void)testFilteredArrayUsingNilPredicateNotObserving:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncItemsRepository filteredArrayUsingPredicate:nil];
    [mockObserver verify];
    [asyncItemsRepository removeObserver:mockObserver];
}

+(void)testFilteredArrayUsingPredicate:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    NSArray *filteredArray = [asyncItemsRepository filteredArrayUsingPredicate:
                              [NSPredicate predicateWithBlock:
                               ^BOOL(id evaluatedObject, NSDictionary *bindings) {
                                   return NO;
                               }]];
    assertThat(filteredArray, notNilValue());
}

+(void)testFilteredArrayUsingPredicateNotObserving:(id<ERNAsyncItemsRepository>)asyncItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncItemsRepository filteredArrayUsingPredicate:
     [NSPredicate predicateWithBlock:
      ^BOOL(id evaluatedObject, NSDictionary *bindings) {
          return NO;
      }]];
    [mockObserver verify];
    [asyncItemsRepository removeObserver:mockObserver];
}

-(void)dummyMethodForSelector
{
}

@end
