#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNBinaryToggleTest.h"
#import "ERNObservableTest.h"
#import "ERNMockObserver.h"

@implementation ERNBinaryToggleTest {
}

#pragma mark - ERNBinaryToggle protocol tests

+(void)testBinaryToggle:(id<ERNBinaryToggle>)binaryToggle
{
    [ERNObservableTest testObservable:binaryToggle];
    [self testDefaultSelected:binaryToggle];
    [self testSetSelected:binaryToggle];
    [self testSetUnselected:binaryToggle];
    [self testSetSelectedObserving:binaryToggle];
    [self testSetUnSelectedObserving:binaryToggle];
    [self testSelectedNotObserving:binaryToggle];
}

+(void)testDefaultSelected:(id<ERNBinaryToggle>)binaryToggle
{
    BOOL expectedSelected = NO;
    BOOL selected = [binaryToggle selected];
    assertThatBool(selected, equalToBool(expectedSelected));
}

+(void)testSetSelected:(id<ERNBinaryToggle>)binaryToggle
{
    BOOL expectedSelected = YES;
    [binaryToggle setSelected:expectedSelected];
    BOOL selected = [binaryToggle selected];
    assertThatBool(selected, equalToBool(expectedSelected));
}

+(void)testSetUnselected:(id<ERNBinaryToggle>)binaryToggle
{
    BOOL expectedSelected = NO;
    [binaryToggle setSelected:expectedSelected];
    BOOL selected = [binaryToggle selected];
    assertThatBool(selected, equalToBool(expectedSelected));
}

+(void)testSetSelectedObserving:(id<ERNBinaryToggle>)binaryToggle
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [[mockObserver expect] dummyMethodForSelector];
    [binaryToggle addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [binaryToggle setSelected:YES];
    [mockObserver verify];
    [binaryToggle removeObserver:mockObserver];
}

+(void)testSetUnSelectedObserving:(id<ERNBinaryToggle>)binaryToggle
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [[mockObserver expect] dummyMethodForSelector];
    [binaryToggle addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [binaryToggle setSelected:NO];
    [mockObserver verify];
    [binaryToggle removeObserver:mockObserver];
}

+(void)testSelectedNotObserving:(id<ERNBinaryToggle>)binaryToggle
{
    id mockObserver = [OCMockObject mockForClass:[ERNMockObserver class]];
    [binaryToggle addObserver:mockObserver selector:@selector(dummyMethodForSelector)];
    [binaryToggle selected];
    [mockObserver verify];
    [binaryToggle removeObserver:mockObserver];
}

-(void)dummyMethodForSelector
{
}

@end
