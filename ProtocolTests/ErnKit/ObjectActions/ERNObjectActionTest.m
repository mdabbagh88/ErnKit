#import <OCMock/OCMock.h>
#import "ERNObjectActionTest.h"

@implementation ERNObjectActionTest {
}

#pragma mark - ERNObjectAction protocol tests

+(void)testObjectAction:(id<ERNObjectAction>)objectAction
{
    [self testActionForNilObject:objectAction];
    [self testActionForObject:objectAction];
}

+(void)testActionForNilObject:(id<ERNObjectAction>)objectAction
{
    [objectAction actionForObject:nil];
}

+(void)testActionForObject:(id<ERNObjectAction>)objectAction
{
    [objectAction actionForObject:[OCMockObject mockForClass:[NSObject class]]];
}

@end
