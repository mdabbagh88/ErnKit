
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNBinaryToggleActionTest.h"
#import "ERNBinaryToggleAction.h"
#import "NSObject+ERNHelper.h"

@implementation ERNBinaryToggleActionTest

-(void)testSelectedSetWithNilAction
{
    //given
    ERNBinaryToggleAction *binaryToggleAction = [ERNBinaryToggleAction createWithAction:nil];
    BOOL expectedSelected = NO;

    //when
    BOOL selected = [binaryToggleAction selected];

    //then
    assertThatBool(selected, equalToBool(expectedSelected));
}

-(void)testSelectedDefaultWithNilAction
{
    //given
    ERNBinaryToggleAction *binaryToggleAction = [ERNBinaryToggleAction createWithAction:nil];
    BOOL expectedSelected = YES;
    [binaryToggleAction setSelected:expectedSelected];

    //when
    BOOL selected = [binaryToggleAction selected];

    //then
    assertThatBool(selected, equalToBool(expectedSelected));
    
}

-(void)testSelectedSetWithAction
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    ERNBinaryToggleAction *binaryToggleAction =
    [ERNBinaryToggleAction createWithAction:mockAction];
    BOOL expectedSelected = NO;

    //when
    BOOL selected = [binaryToggleAction selected];

    //then
    assertThatBool(selected, equalToBool(expectedSelected));
    [mockAction verify];
}

-(void)testSelectedDefaultWithAction
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    ERNBinaryToggleAction *binaryToggleAction =
    [ERNBinaryToggleAction createWithAction:mockAction];
    BOOL expectedSelected = YES;
    [binaryToggleAction setSelected:expectedSelected];

    //when
    BOOL selected = [binaryToggleAction selected];

    //then
    assertThatBool(selected, equalToBool(expectedSelected));
    [mockAction verify];

}

-(void)testToggleWithNilActionsToNilResource
{
    //given
    ERNBinaryToggleAction *binaryToggleAction = [ERNBinaryToggleAction createWithAction:nil];

    //when, then
    [binaryToggleAction setSelected:YES];
    [binaryToggleAction actionForResource:nil];
}

-(void)testToggleWithNilActionsToResource
{
    //given
    ERNBinaryToggleAction *binaryToggleAction = [ERNBinaryToggleAction createWithAction:nil];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@""];

    //when, then
    [binaryToggleAction setSelected:YES];
    [binaryToggleAction actionForResource:resource];
}

-(void)testNoToggleWithAction
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    ERNBinaryToggleAction *binaryToggleAction = [ERNBinaryToggleAction createWithAction:mockAction];

    //when, then
    [binaryToggleAction setSelected:NO];
    [binaryToggleAction actionForResource:resource];

    [mockAction verify];
}

-(void)testToggleWithAction
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    [[mockAction expect] actionForResource:resource];
    ERNBinaryToggleAction *binaryToggleAction = [ERNBinaryToggleAction createWithAction:mockAction];

    //when, then
    [binaryToggleAction setSelected:YES];
    [binaryToggleAction actionForResource:resource];

    [mockAction verify];
}

-(void)testTwoToggleWithAction
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    ERNBinaryToggleAction *binaryToggleAction = [ERNBinaryToggleAction createWithAction:mockAction];

    //when, then
    [binaryToggleAction setSelected:YES];
    [binaryToggleAction setSelected:NO];
    [binaryToggleAction actionForResource:resource];

    [mockAction verify];
}

@end
