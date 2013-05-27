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
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionNilTransitionerNilConfiguratorUrlNilMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:nil];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:nil];
}

-(void)testActionNilTransitionerNilConfiguratorNilUrlMime
{
    //given
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:nil];

    //when, then
    [action actionForUrl:nil
                    mime:expectedMime];
}

-(void)testActionNilTransitionerNilConfiguratorUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:nil];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:expectedMime];
}

-(void)testActionTransitionerNilConfiguratorNilUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionTransitionerNilConfiguratorUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:nil];
}

-(void)testActionTransitionerNilConfiguratorNilUrlMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForUrl:nil
                    mime:expectedMime];
}

-(void)testActionTransitionerNilConfiguratorUrlMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:expectedMime];
}

-(void)testActionNilTransitionerConfiguratorNilUrlNilMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionNilTransitionerConfiguratorUrlNilMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:nil];
}

-(void)testActionNilTransitionerConfiguratorNilUrlMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:nil
                    mime:expectedMime];
}

-(void)testActionNilTransitionerConfiguratorUrlMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:expectedMime];
}


-(void)testActionTransitionerConfiguratorNilUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionTransitionerConfiguratorUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:nil];
}

-(void)testActionTransitionerConfiguratorNilUrlMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:nil
                    mime:expectedMime];
}

-(void)testActionTransitionerConfiguratorUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    [[[mockConfigurator expect] andReturn:mockViewController]
     createViewControllerForUrl:expectedUrl
     mime:expectedMime
     dismisser:mockTransitioner];
    [[mockTransitioner expect] transitionToViewController:mockViewController];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:expectedMime];

    //then
    [mockConfigurator verify];
    [mockTransitioner verify];
}

@end
