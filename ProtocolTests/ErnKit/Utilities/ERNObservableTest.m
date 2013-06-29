#import <OCMock/OCMock.h>
#import "ERNObservableTest.h"
#import "ERNMockObserver.h"

@implementation ERNObservableTest {
}

#pragma mark - ERNObservable protocol tests

+(void)testObservable:(id<ERNObservable>)observable
{
    [self testRemoveNilObserver:observable];
    [self testRemoveNonAddedObserver:observable];
    [self testAddAndRemoveObserver:observable];
    [self testAddAndRemoveObserverWithNilSelector:observable];
    [self testAddNilObserver:observable];
}

+(void)testRemoveNilObserver:(id<ERNObservable>)observable
{
    [observable removeObserver:nil];
}

+(void)testRemoveNonAddedObserver:(id<ERNObservable>)observable
{
    [observable removeObserver:[OCMockObject mockForClass:[NSObject class]]];
}

+(void)testAddAndRemoveObserver:(id<ERNObservable>)observable
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [observable addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [observable removeObserver:mockObserver];
}

+(void)testAddAndRemoveObserverWithNilSelector:(id<ERNObservable>)observable
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [observable addObserver:mockObserver selector:nil];
    [observable removeObserver:mockObserver];
}

+(void)testAddNilObserver:(id<ERNObservable>)observable
{
    [observable addObserver:nil selector:@selector(dummyMethodForSelector)];
}

-(void)dummyMethodForSelector
{
}

@end
