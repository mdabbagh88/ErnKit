#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNConverterAsyncRepositoryTest.h"
#import "ERNConverterAsyncRepository.h"
#import "ERNAsyncRepositoryTest.h"
#import "ERNMockObserver.h"

@implementation ERNConverterAsyncRepositoryTest {
}

#pragma mark - ERNAsyncRepository protocol tests

-(void)testAsyncRepositoryProtocolWithNilRepository
{
    [ERNAsyncRepositoryTest testAsyncRepository:
     [ERNConverterAsyncRepository createWithRepository:nil]];
}

-(void)testAsyncRepositoryProtocolWithRepository
{
    id niceMockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    [ERNAsyncRepositoryTest testAsyncRepository:
     [ERNConverterAsyncRepository createWithRepository:niceMockRepository]];
}

#pragma mark - class tests

-(void)testRefreshRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    [[mockRepository expect] refresh];
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:mockRepository];

    //when
    [repository refresh];

    //then
    [mockRepository verify];
}

-(void)testRemoveObserverRepository
{
    //given
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    [[mockRepository expect] removeObserver:mockObserver];
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:mockRepository];

    //when
    [repository removeObserver:mockObserver];

    //then
    [mockObserver verify];
    [mockRepository verify];
}

-(void)testAddObserverSelectorRepository
{
    //given
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    [[mockRepository expect] addObserver:mockObserver
                                selector:@selector(dummyMethodForSelector)];
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:mockRepository];

    //when
    [repository addObserver:mockObserver
                   selector:@selector(dummyMethodForSelector)];

    //then
    [mockRepository verify];
    [mockObserver verify];
}

-(void)dummyMethodForSelector
{
}

@end
