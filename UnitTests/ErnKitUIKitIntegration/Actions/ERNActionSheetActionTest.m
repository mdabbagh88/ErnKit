#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNActionSheetActionTest.h"
#import "ERNActionSheetAction.h"
#import "ERNActionSheetFactory.h"
#import "ERNActionSheetTransitioner.h"
#import "ERNActionTest.h"

@implementation ERNActionSheetActionTest {
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolWithNilTransitionerNilFactory
{
    [ERNActionTest testAction:[ERNActionSheetAction createWithTransitioner:nil
                                                              factory:nil]];
}

-(void)testActionProtocolWithTransitionerNilFactory
{
    id mockTransitioner = [OCMockObject niceMockForProtocol:@protocol(ERNActionSheetTransitioner)];
    [ERNActionTest testAction:[ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           factory:nil]];
}

-(void)testActionProtocolWithNilTransitionerFactory
{
    id mockFactory = [OCMockObject niceMockForProtocol:@protocol(ERNActionSheetFactory)];
    [ERNActionTest testAction:[ERNActionSheetAction createWithTransitioner:nil
                                                              factory:mockFactory]];
}

-(void)testActionProtocolWithTransitionerFactory
{
    //given
    id mockTransitioner = [OCMockObject niceMockForProtocol:@protocol(ERNActionSheetTransitioner)];
    id mockFactory = [OCMockObject niceMockForProtocol:@protocol(ERNActionSheetFactory)];
    [ERNActionTest testAction:[ERNActionSheetAction createWithTransitioner:mockTransitioner
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
    id mockActionSheet = [OCMockObject mockForClass:[UIActionSheet class]];
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNActionSheetFactory)];
    [[[mockFactory expect] andReturn:mockActionSheet] createActionSheetForResource:resource];
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNActionSheetTransitioner)];
    [[mockTransitioner expect] transitionToActionSheet:mockActionSheet];
    id<ERNAction> action = [ERNActionSheetAction createWithTransitioner:mockTransitioner
                                                           factory:mockFactory];
    
    //when, then
    [action actionForResource:resource];
    
    //then
    [mockFactory verify];
    [mockTransitioner verify];
}

@end
