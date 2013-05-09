#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNConverterAsyncRepositoryTest.h"
#import "ERNConverterAsyncRepository.h"

@implementation ERNConverterAsyncRepositoryTest

-(void)testRefreshNilRepository
{
    //given
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:nil];

    //when, then
    [repository refresh];
}

-(void)testAddNilObserverNilSelectorNilRepository
{
    //given
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:nil];

    //when, then
    [repository addObserver:nil
                   selector:nil];
}

-(void)testAddObserverNilSelectorNilRepository
{
    //given
    id mockObserver = [OCMockObject mockForClass:[NSObject class]];
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:nil];

    //when
    [repository addObserver:mockObserver
                   selector:nil];

    //then
    [mockObserver verify];
}

-(void)testAddNilObserverSelectorNilRepository
{
    //given
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:nil];

    //when, then
    [repository addObserver:nil
                   selector:@selector(testAddNilObserverSelectorNilRepository)];
}

-(void)testAddObserverSelectorNilRepository
{
    //given
    id mockObserver = [OCMockObject mockForClass:[NSObject class]];
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:nil];

    //when
    [repository addObserver:mockObserver
                   selector:@selector(testAddNilObserverSelectorNilRepository)];

    //then
    [mockObserver verify];
}

-(void)testRemoveNilObserverNilRepository
{
    //given
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:nil];

    //when, then
    [repository removeObserver:nil];

}

-(void)testRemoveObserverNilRepository
{
    //given
    id mockObserver = [OCMockObject mockForClass:[NSObject class]];
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:nil];

    //when
    [repository removeObserver:mockObserver];

    //then
    [mockObserver verify];
}

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

-(void)testAddNilObserverNilSelectorRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:mockRepository];

    //when
    [repository addObserver:nil
                   selector:nil];

    //then
    [mockRepository verify];
}

-(void)testAddObserverNilSelectorRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    id mockObserver = [OCMockObject mockForClass:[NSObject class]];
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:mockRepository];

    //when
    [repository addObserver:mockObserver
                   selector:nil];

    //then
    [mockRepository verify];
    [mockObserver verify];
}

-(void)testAddNilObserverSelectorRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:mockRepository];

    //when
    [repository addObserver:nil
                   selector:@selector(testAddNilObserverSelectorNilRepository)];

    //then
    [mockRepository verify];
}

-(void)testAddObserverSelectorRepository
{
    //given
    id mockObserver = [OCMockObject mockForClass:[NSObject class]];
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    [[mockRepository expect] addObserver:mockObserver
                                selector:@selector(testAddNilObserverSelectorRepository)];
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:mockRepository];

    //when
    [repository addObserver:mockObserver
                   selector:@selector(testAddNilObserverSelectorRepository)];

    //then
    [mockRepository verify];
    [mockObserver verify];
}

-(void)testRemoveNilObserverRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    ERNConverterAsyncRepository *repository =
    [[ERNConverterAsyncRepository alloc] initWithRepository:mockRepository];

    //when
    [repository removeObserver:nil];

    //then
    [mockRepository verify];

}

-(void)testRemoveObserverRepository
{
    //given
    id mockObserver = [OCMockObject mockForClass:[NSObject class]];
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


@end
