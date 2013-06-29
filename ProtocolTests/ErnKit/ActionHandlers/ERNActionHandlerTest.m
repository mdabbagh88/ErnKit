#import <OCMock/OCMock.h>
#import "ERNActionHandlerTest.h"

@implementation ERNActionHandlerTest {
}

#pragma mark - ERNActionHandler protocol tests

+(void)testActionHandler:(id<ERNActionHandler>)actionHandler
{
    [self testActionForNilObject:actionHandler];
    [self testActionForObject:actionHandler];
}

+(void)testActionForNilObject:(id<ERNActionHandler>)actionHandler
{
    [actionHandler actionForObject:nil];
}

+(void)testActionForObject:(id<ERNActionHandler>)action
{
    [action actionForObject:[OCMockObject mockForClass:[NSObject class]]];
}

@end
