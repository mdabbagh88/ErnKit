#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNLogActionTest.h"
#import "ERNLogAction.h"
#import "ERNActionTest.h"
#import "NSURL+ERNHelper.h"

// Ocular inspection of output only, extract actual printing?

@implementation ERNLogActionTest {
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolNilResource
{
    [ERNActionTest testAction:[ERNLogAction createWithLogString:nil]];
}

-(void)testActionProtocolResource
{
    [ERNActionTest testAction:[ERNLogAction createWithLogString:@"logString"]];
}

@end
