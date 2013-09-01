#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewControllerActionTest.h"
#import "ERNViewControllerAction.h"
#import "ERNViewControllerTransitioner.h"
#import "ERNViewControllerFactory.h"
#import "ERNActionTest.h"

@implementation ERNViewControllerActionTest {
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolWithNilTransitionerNilFactory
{
    [ERNActionTest testAction:[ERNViewControllerAction createWithTransitioner:nil
                                                                 factory:nil]];
}

-(void)testActionProtocolWithTransitionerNilFactory
{
    id mockTransitioner =
    [OCMockObject niceMockForProtocol:@protocol(ERNViewControllerTransitioner)];
    [ERNActionTest testAction:[ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                              factory:nil]];
}

-(void)testActionProtocolWithNilTransitionerFactory
{
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNViewControllerFactory)];
    [ERNActionTest testAction:[ERNViewControllerAction createWithTransitioner:nil
                                                                 factory:mockFactory]];
}

-(void)testActionProtocolWithTransitionerFactory
{
    //given
    id mockTransitioner =
    [OCMockObject niceMockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id mockFactory =
    [OCMockObject niceMockForProtocol:@protocol(ERNViewControllerFactory)];
    [ERNActionTest testAction:[ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                                 factory:mockFactory]];
}

#pragma mark - class tests

-(void)testActionTransitionerFactoryResource
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNViewControllerFactory)];
    [[[mockFactory expect] andReturn:mockViewController]
     createViewControllerForResource:resource
     dismisser:mockTransitioner];
    [[mockTransitioner expect] transitionToViewController:mockViewController];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           factory:mockFactory];

    //when, then
    [action actionForResource:resource];

    //then
    [mockFactory verify];
    [mockTransitioner verify];
}

@end
