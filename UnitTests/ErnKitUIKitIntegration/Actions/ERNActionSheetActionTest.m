#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNActionSheetActionTest.h"
#import "ERNActionSheetAction.h"
#import "ERNActionSheetConfigurator.h"
#import "ERNActionSheetTransitioner.h"
#import "ERNActionTest.h"

@implementation ERNActionSheetActionTest {
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolWithNilTransitionerNilConfigurator
{
    [ERNActionTest testAction:[ERNActionSheetAction createWithTransitioner:nil
                                                              configurator:nil]];
}

-(void)testActionProtocolWithTransitionerNilConfigurator
{
    id mockTransitioner = [OCMockObject niceMockForProtocol:@protocol(ERNActionSheetTransitioner)];
    [ERNActionTest testAction:[ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:nil]];
}

-(void)testActionProtocolWithNilTransitionerConfigurator
{
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    [ERNActionTest testAction:[ERNActionSheetAction createWithTransitioner:nil
                                                              configurator:mockConfigurator]];
}

-(void)testActionProtocolWithTransitionerConfigurator
{
    //given
    id mockTransitioner = [OCMockObject niceMockForProtocol:@protocol(ERNActionSheetTransitioner)];
    id mockConfigurator = [OCMockObject niceMockForProtocol:@protocol(ERNActionSheetConfigurator)];
    [ERNActionTest testAction:[ERNActionSheetAction createWithTransitioner:mockTransitioner
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
