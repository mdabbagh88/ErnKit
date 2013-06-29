#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNActionTogglerActionTest.h"
#import "ERNActionTogglerAction.h"
#import "NSObject+ERNHelper.h"
#import "ERNActionTest.h"
#import "ERNTogglerTest.h"

@interface ERNActionTogglerActionTest ()
@property (nonatomic) ERNActionTogglerAction *nilActionsActionTogglerAction;
@property (nonatomic) ERNActionTogglerAction *nonActionsActionTogglerAction;
@property (nonatomic) ERNActionTogglerAction *actionsActionTogglerAction;
@property (nonatomic) ERNActionTogglerAction *niceActionsActionTogglerAction;
@property (nonatomic) id mockAction1;
@property (nonatomic) id mockAction2;
@property (nonatomic) ERNResource *resource;
@end

@implementation ERNActionTogglerActionTest {
}

#pragma mark - SenTestCase

-(void)setUp
{
    [self setResource:[ERNResource createWithUrl:[NSURL URLWithString:@"url"] mime:@"mime"]];

    [self setMockAction1:[OCMockObject mockForProtocol:@protocol(ERNAction)]];
    [self setMockAction2:[OCMockObject mockForProtocol:@protocol(ERNAction)]];

    [self setNilActionsActionTogglerAction:[ERNActionTogglerAction createWithActions:nil]];
    [self setNonActionsActionTogglerAction:[ERNActionTogglerAction createWithActions:@[@"", @[]]]];
    [self setActionsActionTogglerAction:
     [ERNActionTogglerAction createWithActions:@[[self mockAction1], [self mockAction2]]]];
    [self setNiceActionsActionTogglerAction:
     [ERNActionTogglerAction createWithActions:@[
                                                 [OCMockObject niceMockForProtocol:@protocol(ERNAction)],
                                                 [OCMockObject niceMockForProtocol:@protocol(ERNAction)]]]];
}

-(void)tearDown
{
    [[self mockAction1] verify];
    [[self mockAction2] verify];
}

#pragma mark - ERNToggler protocol tests

-(void)testTogglerProtocolNilActions
{
    [ERNTogglerTest testToggler:[self nilActionsActionTogglerAction]];
}

-(void)testTogglerProtocolNonActions
{
    [ERNTogglerTest testToggler:[self nonActionsActionTogglerAction]];
}

-(void)testTogglerProtocolActions
{
    [ERNTogglerTest testToggler:[self niceActionsActionTogglerAction]];
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolNilActions
{
    [ERNActionTest testAction:[self nilActionsActionTogglerAction]];
}

-(void)testActionProtocolNilActionsIndexSet
{
    [[self nilActionsActionTogglerAction] setSelectedIndex:1];
    [ERNActionTest testAction:[self nilActionsActionTogglerAction]];
}

-(void)testActionProtocolNonActions
{
    [ERNActionTest testAction:[self nonActionsActionTogglerAction]];
}

-(void)testActionProtocolNonActionsIndexSet
{
    [[self nonActionsActionTogglerAction] setSelectedIndex:1];
    [ERNActionTest testAction:[self nonActionsActionTogglerAction]];
}

-(void)testActionProtocolNonActionsOutsideOfIndexSet
{
    [[self nonActionsActionTogglerAction] setSelectedIndex:5];
    [ERNActionTest testAction:[self nonActionsActionTogglerAction]];
}

-(void)testActionProtocolActions
{
    [ERNActionTest testAction:[self niceActionsActionTogglerAction]];
}

-(void)testActionProtocolActionsIndexSet
{
    [[self niceActionsActionTogglerAction] setSelectedIndex:1];
    [ERNActionTest testAction:[self niceActionsActionTogglerAction]];
}

-(void)testActionProtocolActionsOutsideOfIndexSet
{
    [[self actionsActionTogglerAction] setSelectedIndex:UINT_MAX];
    [ERNActionTest testAction:[self actionsActionTogglerAction]];
}

#pragma mark - class tests

-(void)testSelectedIndexWithNilActions
{
    //given
    NSUInteger expectedIndex = 5;
    [[self nilActionsActionTogglerAction] setSelectedIndex:expectedIndex];

    //when
    NSUInteger selectedIndex = [[self nilActionsActionTogglerAction] selectedIndex];

    //then
    assertThatUnsignedInteger(selectedIndex, equalToUnsignedInteger(expectedIndex));

}

-(void)testToggleWithActions
{
    //given
    [[[self mockAction2] expect] actionForResource:[self resource]];
    
    //when
    [[self actionsActionTogglerAction] setSelectedIndex:1];
    [[self actionsActionTogglerAction] actionForResource:[self resource]];
}

-(void)testTwoToggleWithActions
{
    //given
    [[[self mockAction1] expect] actionForResource:[self resource]];
    
    //when
    [[self actionsActionTogglerAction] setSelectedIndex:1];
    [[self actionsActionTogglerAction] setSelectedIndex:0];
    [[self actionsActionTogglerAction] actionForResource:[self resource]];
}

-(void)testActionWithoutToggleWithActions
{
    //given
    [[[self mockAction1] expect] actionForResource:[self resource]];
    
    //when
    [[self actionsActionTogglerAction] actionForResource:[self resource]];
}

@end
