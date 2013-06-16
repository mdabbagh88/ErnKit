#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNActionSheetActionTest.h"
#import "ERNActionSheetAction.h"
#import "ERNActionSheetConfigurator.h"
#import "ERNActionSheetTransitioner.h"

@implementation ERNActionSheetActionTest

-(void)testActionNilTransitionerNilConfiguratorNilResource
{
    //given
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:nil];
    
    //when, then
    [action actionForResource:nil];
}

-(void)testActionNilTransitionerNilConfiguratorResource
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

-(void)testActionTransitionerNilConfiguratorNilResource
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];
    
    //when, then
    [action actionForResource:nil];
}

-(void)testActionTransitionerNilConfiguratorResource
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

-(void)testActionNilTransitionerConfiguratorNilResource
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];
    
    //when, then
    [action actionForResource:nil];
}

-(void)testActionNilTransitionerConfiguratorResource
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


-(void)testActionTransitionerConfiguratorNilResource
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNActionSheetConfigurator)];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];
    
    //when, then
    [action actionForResource:nil];
}

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
