#import "ERNActionTest.h"

@implementation ERNActionTest {
}

#pragma mark - ERNAction protocol tests

+(void)testAction:(id<ERNAction>)action
{
    [self testActionForNilResource:action];
    [self testActionForResource:action];
}

+(void)testActionForNilResource:(id<ERNAction>)action
{
    [action actionForResource:nil];
}

+(void)testActionForResource:(id<ERNAction>)action
{
    [action actionForResource:[ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                    mime:@"mime"]];
}

@end
