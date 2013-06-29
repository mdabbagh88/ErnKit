#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNAsyncPaginatedItemsRepositoryTest.h"
#import "ERNAsyncItemsRepositoryTest.h"
#import "ERNMockObserver.h"

@implementation ERNAsyncPaginatedItemsRepositoryTest {
}

#pragma mark - ERNAsyncPaginatedItemsRepository protocol tests

+(void)testAsyncPaginatedItemsRepository:(id<ERNAsyncPaginatedItemsRepository>)asyncPaginatedItemsRepository
{
    [ERNAsyncItemsRepositoryTest testAsyncItemsRepository:asyncPaginatedItemsRepository];
    [self testTotal:asyncPaginatedItemsRepository];
    [self testTotalNotObserving:asyncPaginatedItemsRepository];
    [self testOffset:asyncPaginatedItemsRepository];
    [self testOffsetNotObserving:asyncPaginatedItemsRepository];
    [self testHasPrevious:asyncPaginatedItemsRepository];
    [self testHasPreviousNotObserving:asyncPaginatedItemsRepository];
    [self testHasNext:asyncPaginatedItemsRepository];
    [self testHasNextNotObserving:asyncPaginatedItemsRepository];
    [self testFetchNext:asyncPaginatedItemsRepository];
    [self testFetchPrevious:asyncPaginatedItemsRepository];
}

+(void)testTotal:(id<ERNAsyncPaginatedItemsRepository>)asyncPaginatedItemsRepository
{
    [asyncPaginatedItemsRepository total];
}

+(void)testOffset:(id<ERNAsyncPaginatedItemsRepository>)asyncPaginatedItemsRepository
{
    [asyncPaginatedItemsRepository offset];
}

+(void)testHasPrevious:(id<ERNAsyncPaginatedItemsRepository>)asyncPaginatedItemsRepository
{
    [asyncPaginatedItemsRepository hasPrevious];
}

+(void)testHasNext:(id<ERNAsyncPaginatedItemsRepository>)asyncPaginatedItemsRepository
{
    [asyncPaginatedItemsRepository hasNext];
}

+(void)testTotalNotObserving:(id<ERNAsyncPaginatedItemsRepository>)asyncPaginatedItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncPaginatedItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncPaginatedItemsRepository total];
    [mockObserver verify];
    [asyncPaginatedItemsRepository removeObserver:mockObserver];
}

+(void)testOffsetNotObserving:(id<ERNAsyncPaginatedItemsRepository>)asyncPaginatedItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncPaginatedItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncPaginatedItemsRepository offset];
    [mockObserver verify];
    [asyncPaginatedItemsRepository removeObserver:mockObserver];
}

+(void)testHasPreviousNotObserving:(id<ERNAsyncPaginatedItemsRepository>)asyncPaginatedItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncPaginatedItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncPaginatedItemsRepository hasPrevious];
    [mockObserver verify];
    [asyncPaginatedItemsRepository removeObserver:mockObserver];
}

+(void)testHasNextNotObserving:(id<ERNAsyncPaginatedItemsRepository>)asyncPaginatedItemsRepository
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [asyncPaginatedItemsRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncPaginatedItemsRepository hasNext];
    [mockObserver verify];
    [asyncPaginatedItemsRepository removeObserver:mockObserver];
}

+(void)testFetchNext:(id<ERNAsyncPaginatedItemsRepository>)asyncPaginatedItemsRepository
{
    [asyncPaginatedItemsRepository fetchNext];
}

+(void)testFetchPrevious:(id<ERNAsyncPaginatedItemsRepository>)asyncPaginatedItemsRepository
{
    [asyncPaginatedItemsRepository fetchPrevious];
}

-(void)dummyMethodForSelector
{
}

@end
