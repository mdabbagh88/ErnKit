#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNTogglerTest.h"
#import "ERNObservableTest.h"
#import "ERNMockObserver.h"

@implementation ERNTogglerTest {
}

#pragma mark - ERNToggler protocol tests

+(void)testToggler:(id<ERNToggler>)toggler
{
    [self testSetSelectedIndexZero:toggler];
    [self testSetSelectedIndexSomeValue:toggler];
    [self testSetSelectedIndexMaxUnsignedInteger:toggler];
    [self testSetSelectedIndexObserving:toggler];
    [self testSelectedNotObserving:toggler];
    [ERNObservableTest testObservable:toggler];
}

+(void)testSetSelectedIndexZero:(id<ERNToggler>)toggler
{
    NSUInteger index = 0;
    [toggler setSelectedIndex:index];
    assertThatUnsignedInteger([toggler selectedIndex], equalToUnsignedInteger(index));
}

+(void)testSetSelectedIndexSomeValue:(id<ERNToggler>)toggler
{
    NSUInteger index = 1;
    [toggler setSelectedIndex:index];
    assertThatUnsignedInteger([toggler selectedIndex], equalToUnsignedInteger(index));
}

+(void)testSetSelectedIndexMaxUnsignedInteger:(id<ERNToggler>)toggler
{
    NSUInteger index = UINT_MAX;
    [toggler setSelectedIndex:index];
    assertThatUnsignedInteger([toggler selectedIndex], equalToUnsignedInteger(index));
}

+(void)testSetSelectedIndexObserving:(id<ERNToggler>)toggler
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [[mockObserver expect] dummyMethodForSelector];
    [toggler addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [toggler setSelectedIndex:1];
    [mockObserver verify];
    [toggler removeObserver:mockObserver];
}

+(void)testSelectedNotObserving:(id<ERNToggler>)toggler
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [toggler addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [toggler selectedIndex];
    [mockObserver verify];
    [toggler removeObserver:mockObserver];
}

-(void)dummyMethodForSelector
{
}

@end
