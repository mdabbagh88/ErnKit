#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNBinaryToggleActionTest.h"
#import "ERNBinaryToggleAction.h"
#import "NSObject+ERNHelper.h"
#import "ERNBinaryToggleTest.h"
#import "ERNActionTest.h"

@interface ERNBinaryToggleActionTest ()
@property (nonatomic) ERNBinaryToggleAction *nilActionAction;
@property (nonatomic) ERNBinaryToggleAction *actionAction;
@property (nonatomic) ERNBinaryToggleAction *niceActionAction;
@property (nonatomic) id mockAction;
@property (nonatomic) ERNResource *resource;
@end

@implementation ERNBinaryToggleActionTest {
}

#pragma mark - SenTestCase

-(void)setUp
{
    [self setResource:[ERNResource createWithUrl:[NSURL URLWithString:@"url"] mime:@"mime"]];

    [self setMockAction:[OCMockObject mockForProtocol:@protocol(ERNAction)]];

    [self setNilActionAction:[ERNBinaryToggleAction createWithAction:nil]];
    [self setActionAction:[ERNBinaryToggleAction createWithAction:[self mockAction]]];
    [self setNiceActionAction:[ERNBinaryToggleAction createWithAction:
                               [OCMockObject niceMockForProtocol:@protocol(ERNAction)]]];
}

-(void)tearDown
{
    [[self mockAction] verify];
}

#pragma mark - ERNBinaryToggle protocol tests

-(void)testBinaryToggleProtocolNilAction
{
    [ERNBinaryToggleTest testBinaryToggle:[self nilActionAction]];
}

-(void)testBinaryToggleProtocolAction
{
    [ERNBinaryToggleTest testBinaryToggle:[self niceActionAction]];
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolNilAction
{
    [ERNActionTest testAction:[self nilActionAction]];
}

-(void)testActionProtocolNilActionBinaryToggled
{
    [[self nilActionAction] setSelected:YES];
    [ERNActionTest testAction:[self nilActionAction]];
}

-(void)testActionProtocolActions
{
    [ERNActionTest testAction:[self niceActionAction]];
}

-(void)testActionProtocolActionsBinaryToggled
{
    [[self niceActionAction] setSelected:YES];
    [ERNActionTest testAction:[self niceActionAction]];
}

#pragma mark - class tests

-(void)testToggleWithAction
{
    //given
    [[[self mockAction] expect] actionForResource:[self resource]];

    //when
    [[self actionAction] setSelected:YES];
    [[self actionAction] actionForResource:[self resource]];
}

-(void)testTwoToggleWithAction
{
    [[self actionAction] setSelected:YES];
    [[self actionAction] setSelected:NO];
    [[self actionAction] actionForResource:[self resource]];
}

@end
