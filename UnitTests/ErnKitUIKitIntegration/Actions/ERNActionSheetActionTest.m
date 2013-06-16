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
    [action actionForResource:nil];
}

-(void)testActionNilTransitionerNilConfiguratorUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:nil];

    //when, then
    [action actionForResource:resource];
}

-(void)testActionTransitionerNilConfiguratorNilUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionTransitionerNilConfiguratorUrlMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForResource:resource];
}

-(void)testActionNilTransitionerConfiguratorNilUrlNilMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionNilTransitionerConfiguratorUrlMime
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForResource:resource];
}


-(void)testActionTransitionerConfiguratorNilUrlNilMime
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
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
    id mockActionSheet = [OCMockObject mockForClass:[UIActionSheet class]];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    [[[mockConfigurator expect] andReturn:mockActionSheet] createActionSheetForResource:resource];
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    [[mockTransitioner expect] transitionToActionSheet:mockActionSheet];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForResource:resource];

    //then
    [mockConfigurator verify];
    [mockTransitioner verify];
}

@end
