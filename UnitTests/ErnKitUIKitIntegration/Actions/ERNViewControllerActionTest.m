#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewControllerActionTest.h"
#import "ERNViewControllerAction.h"
#import "ERNViewControllerTransitioner.h"
#import "ERNViewControllerConfigurator.h"
#import "ERNActionTest.h"

@implementation ERNViewControllerActionTest {
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolWithNilTransitionerNilConfigurator
{
    [ERNActionTest testAction:[ERNViewControllerAction createWithTransitioner:nil
                                                                 configurator:nil]];
}

-(void)testActionProtocolWithTransitionerNilConfigurator
{
    id mockTransitioner =
    [OCMockObject niceMockForProtocol:@protocol(ERNViewControllerTransitioner)];
    [ERNActionTest testAction:[ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                              configurator:nil]];
}

-(void)testActionProtocolWithNilTransitionerConfigurator
{
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    [ERNActionTest testAction:[ERNViewControllerAction createWithTransitioner:nil
                                                                 configurator:mockConfigurator]];
}

-(void)testActionProtocolWithTransitionerConfigurator
{
    //given
    id mockTransitioner =
    [OCMockObject niceMockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id mockConfigurator =
    [OCMockObject niceMockForProtocol:@protocol(ERNViewControllerConfigurator)];
    [ERNActionTest testAction:[ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                                 configurator:mockConfigurator]];
}

#pragma mark - class tests

-(void)testActionTransitionerConfiguratorResource
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    [[[mockConfigurator expect] andReturn:mockViewController]
     createViewControllerForResource:resource
     dismisser:mockTransitioner];
    [[mockTransitioner expect] transitionToViewController:mockViewController];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForResource:resource];

    //then
    [mockConfigurator verify];
    [mockTransitioner verify];
}

@end
