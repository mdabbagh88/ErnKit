#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNActionSheetActionTest.h"
#import "ERNActionSheetAction.h"
#import "ERNActionSheetConfigurator.h"
#import "ERNActionSheetTransitioner.h"

@implementation ERNActionSheetActionTest

-(void)testActionNilTransitionerNilConfiguratorNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:nil];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionNilTransitionerNilConfiguratorUrlNilMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:nil];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:nil];
}

-(void)testActionNilTransitionerNilConfiguratorNilUrlMime
{
    //given
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
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
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:nil];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:expectedMime];
}

-(void)testActionTransitionerNilConfiguratorNilUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionTransitionerNilConfiguratorUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:nil];
}

-(void)testActionTransitionerNilConfiguratorNilUrlMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForUrl:nil
                    mime:expectedMime];
}

-(void)testActionTransitionerNilConfiguratorUrlMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:expectedMime];
}

-(void)testActionNilTransitionerConfiguratorNilUrlNilMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionNilTransitionerConfiguratorUrlNilMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:nil];
}

-(void)testActionNilTransitionerConfiguratorNilUrlMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:nil
                    mime:expectedMime];
}

-(void)testActionNilTransitionerConfiguratorUrlMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:expectedMime];
}


-(void)testActionTransitionerConfiguratorNilUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionTransitionerConfiguratorUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:nil];
}

-(void)testActionTransitionerConfiguratorNilUrlMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
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
    id mockActionSheet = [OCMockObject mockForClass:[UIActionSheet class]];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    [[[mockConfigurator expect] andReturn:mockActionSheet] createActionSheetForUrl:expectedUrl
                                                                              mime:expectedMime];
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    [[mockTransitioner expect] transitionToActionSheet:mockActionSheet];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:expectedMime];

    //then
    [mockConfigurator verify];
    [mockTransitioner verify];
}

@end
