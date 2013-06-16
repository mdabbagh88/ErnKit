#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewControllerActionTest.h"
#import "ERNViewControllerAction.h"
#import "ERNViewControllerTransitioner.h"
#import "ERNViewControllerConfigurator.h"

@implementation ERNViewControllerActionTest

-(void)testActionNilTransitionerNilConfiguratorNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:nil];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionNilTransitionerNilConfiguratorUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:nil];

    //when, then
    [action actionForResource:resource];
}

-(void)testActionTransitionerNilConfiguratorNilUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionTransitionerNilConfiguratorUrlMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForResource:resource];
}

-(void)testActionNilTransitionerConfiguratorNilUrlNilMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionNilTransitionerConfiguratorUrlMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForResource:resource];
}


-(void)testActionTransitionerConfiguratorNilUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionTransitionerConfiguratorUrlMime
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
