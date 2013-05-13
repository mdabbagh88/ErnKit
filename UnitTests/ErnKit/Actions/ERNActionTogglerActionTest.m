#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNActionTogglerActionTest.h"
#import "ERNActionTogglerAction.h"
#import "NSObject+ERNHelper.h"

@implementation ERNActionTogglerActionTest

-(void)testToggleWithNilActionsToNilUrlNilMime
{
    //given
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:nil];

    //when, then
    [actionTogglerAction setSelectedIndex:5];
    [actionTogglerAction actionForUrl:nil
                                 mime:nil];
}

-(void)testToggleWithNilActionsToUrlNilMime
{
    //given
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:nil];

    //when, then
    [actionTogglerAction setSelectedIndex:5];
    [actionTogglerAction actionForUrl:[NSURL URLWithString:@"url"]
                                 mime:nil];
}

-(void)testToggleWithNilActionsToUrlMime
{
    //given
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:nil];

    //when, then
    [actionTogglerAction setSelectedIndex:5];
    [actionTogglerAction actionForUrl:[NSURL URLWithString:@"url"]
                                 mime:@""];
}

-(void)testToggleWithNilActionsToNilUrlMime
{
    //given
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:nil];

    //when, then
    [actionTogglerAction setSelectedIndex:5];
    [actionTogglerAction actionForUrl:nil
                                 mime:@""];
}

-(void)testToggleWithNoneActions
{
    //given
    NSArray *nonActions = @[@"", @[]];
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:nonActions];

    //when, then
    [actionTogglerAction setSelectedIndex:1];
    [actionTogglerAction actionForUrl:[NSURL URLWithString:@"url"]
                                 mime:@""];
}

-(void)testToggleOutsideOfArrayWithNoneActions
{
    //given
    NSArray *nonActions = @[@"", @[]];
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:nonActions];

    //when, then
    [actionTogglerAction setSelectedIndex:10];
    [actionTogglerAction actionForUrl:[NSURL URLWithString:@"url"]
                                 mime:@""];
}

-(void)testToggleWithActions
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction2 expect] actionForUrl:expectedUrl
                                  mime:expectedMime];
    NSArray *actions = @[mockAction1, mockAction2];
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:actions];

    //when, then
    [actionTogglerAction setSelectedIndex:1];
    [actionTogglerAction actionForUrl:expectedUrl
                                 mime:expectedMime];

    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testTwoToggleWithActions
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction1 expect] actionForUrl:expectedUrl
                                  mime:expectedMime];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSArray *actions = @[mockAction1, mockAction2];
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:actions];

    //when, then
    [actionTogglerAction setSelectedIndex:1];
    [actionTogglerAction setSelectedIndex:0];
    [actionTogglerAction actionForUrl:expectedUrl
                                 mime:expectedMime];

    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testActionWithoutToggleWithActions
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction1 expect] actionForUrl:expectedUrl
                                  mime:expectedMime];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSArray *actions = @[mockAction1, mockAction2];
    ERNActionTogglerAction *actionTogglerAction = [ERNActionTogglerAction createWithActions:actions];

    //when, then
    [actionTogglerAction actionForUrl:expectedUrl
                                 mime:expectedMime];

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

    //when, then
    [actionTogglerAction setSelectedIndex:10];
    [actionTogglerAction actionForUrl:[NSURL URLWithString:@"url"]
                                 mime:@""];

    [mockAction1 verify];
    [mockAction2 verify];
}

@end
