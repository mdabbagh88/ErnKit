#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNActionTogglerActionTest.h"
#import "ERNActionTogglerAction.h"
#import "NSObject+ERNHelper.h"

@implementation ERNActionTogglerActionTest

-(void)testToggleWithNilActionsToNilResource
{
    //given
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:nil];

    //when, then
    [actionTogglerAction setSelectedIndex:5];
    [actionTogglerAction actionForResource:nil];
}

-(void)testToggleWithNilActionsToResource
{
    //given
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:nil];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@""];

    //when, then
    [actionTogglerAction setSelectedIndex:5];
    [actionTogglerAction actionForResource:resource];
}

-(void)testToggleWithNoneActions
{
    //given
    NSArray *nonActions = @[@"", @[]];
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:nonActions];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@""];

    //when, then
    [actionTogglerAction setSelectedIndex:1];
    [actionTogglerAction actionForResource:resource];
}

-(void)testToggleOutsideOfArrayWithNoneActions
{
    //given
    NSArray *nonActions = @[@"", @[]];
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:nonActions];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@""];

    //when, then
    [actionTogglerAction setSelectedIndex:10];
    [actionTogglerAction actionForResource:resource];
}

-(void)testToggleWithActions
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    [[mockAction2 expect] actionForResource:resource];
    NSArray *actions = @[mockAction1, mockAction2];
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:actions];

    //when, then
    [actionTogglerAction setSelectedIndex:1];
    [actionTogglerAction actionForResource:resource];

    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testTwoToggleWithActions
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    [[mockAction1 expect] actionForResource:resource];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSArray *actions = @[mockAction1, mockAction2];
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:actions];

    //when, then
    [actionTogglerAction setSelectedIndex:1];
    [actionTogglerAction setSelectedIndex:0];
    [actionTogglerAction actionForResource:resource];

    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testActionWithoutToggleWithActions
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    [[mockAction1 expect] actionForResource:resource];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSArray *actions = @[mockAction1, mockAction2];
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:actions];

    //when, then
    [actionTogglerAction actionForResource:resource];

    [mockAction1 verify];
    [mockAction2 verify];
}


-(void)testToggleOutsideOfArrayWithActions
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSArray *actions = @[mockAction1, mockAction2];
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:actions];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@""];

    //when, then
    [actionTogglerAction setSelectedIndex:10];
    [actionTogglerAction actionForResource:resource];

    [mockAction1 verify];
    [mockAction2 verify];
}

@end
