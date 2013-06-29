#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNAsyncRepositoryTest.h"
#import "ERNObservableTest.h"
#import "ERNMockObserver.h"

@implementation ERNAsyncRepositoryTest {
}

#pragma mark - ERNAsyncRepository protocol tests

+(void)testAsyncRepository:(id<ERNAsyncRepository>)asyncRepository
{
    [ERNObservableTest testObservable:asyncRepository];
    [self testRefresh:asyncRepository];
    [self testRefreshObserving:asyncRepository];
}

+(void)testRefresh:(id<ERNAsyncRepository>)asyncRepository
{
    [asyncRepository refresh];
}

+(void)testRefreshObserving:(id<ERNAsyncRepository>)asyncRepository
{
    id mockObserver = [OCMockObject niceMockForClass:[ERNMockObserver class]];
    [[mockObserver expect] dummyMethodForSelector];
    [asyncRepository addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [asyncRepository refresh];
    [mockObserver verify];
    [asyncRepository removeObserver:mockObserver];
}

-(void)dummyMethodForSelector
{
}

@end
