#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTableViewDelegateTest.h"
#import "ERNTableViewDelegate.h"
#import "ERNTableViewManager.h"

@implementation ERNTableViewDelegateTest

-(void)testNilTableViewHeightForRowAtNilIndexPathWithNilManager
{
    //given
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    CGFloat height = [delegate tableView:nil
                 heightForRowAtIndexPath:nil];

    //then
    assertThatFloat(height, equalToFloat(0));
}

-(void)testTableViewHeightForRowAtNilIndexPathWithNilManager
{
    //given
    CGFloat expectedHeight = 45.0f;
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    [[[mockTableView expect] andReturnValue:OCMOCK_VALUE(expectedHeight)] rowHeight];
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    CGFloat height = [delegate tableView:mockTableView
                 heightForRowAtIndexPath:nil];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockTableView verify];
}

-(void)testNilTableViewHeightForRowAtIndexPathWithNilManager
{
    //given
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    CGFloat height = [delegate tableView:nil
                 heightForRowAtIndexPath:mockIndexPath];

    //then
    assertThatFloat(height, equalToFloat(0));
    [mockIndexPath verify];
}

-(void)testTableViewHeightForRowAtIndexPathWithNilManager
{
    //given
    CGFloat expectedHeight = 45.0f;
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    [[[mockTableView expect] andReturnValue:OCMOCK_VALUE(expectedHeight)] rowHeight];
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    CGFloat height = [delegate tableView:mockTableView
                 heightForRowAtIndexPath:mockIndexPath];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockIndexPath verify];
    [mockTableView verify];
}

-(void)testNilTableViewHeightForHeaderInSectionWithNilManager
{
    //given
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    CGFloat height = [delegate tableView:nil
                heightForHeaderInSection:23];

    //then
    assertThatFloat(height, equalToFloat(0));
}

-(void)testTableViewHeightForHeaderInSectionWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    CGFloat height = [delegate tableView:mockTableView
                heightForHeaderInSection:23];

    //then
    assertThatFloat(height, equalToFloat(0));
    [mockTableView verify];
}

-(void)testNilTableViewHeightForFooterInSectionWithNilManager
{
    //given
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    CGFloat height = [delegate tableView:nil
                heightForFooterInSection:43];

    //then
    assertThatFloat(height, equalToFloat(0));
}

-(void)testTableViewHeightForFooterInSectionWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    CGFloat height = [delegate tableView:mockTableView
                heightForFooterInSection:43];

    //then
    assertThatFloat(height, equalToFloat(0));
    [mockTableView verify];
}

-(void)testNilTableViewViewForHeaderInSectionWithNilManager
{
    //given
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    UIView *view = [delegate tableView:nil
                viewForHeaderInSection:43];

    //then
    assertThat(view, nilValue());
}

-(void)testTableViewViewForHeaderInSectionWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    UIView *view = [delegate tableView:mockTableView
                viewForHeaderInSection:43];

    //then
    assertThat(view, nilValue());
    [mockTableView verify];
}

-(void)testNilTableViewViewForFooterInSectionWithNilManager
{
    //given
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    UIView *view = [delegate tableView:nil
                viewForFooterInSection:43];

    //then
    assertThat(view, nilValue());
}

-(void)testTableViewViewForFooterInSectionWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    UIView *view = [delegate tableView:mockTableView
                viewForFooterInSection:43];

    //then
    assertThat(view, nilValue());
    [mockTableView verify];
}

-(void)testNilTableViewDidSelectRowAtNilIndexPathWithNilManager
{
    //given
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when, then
    [delegate tableView:nil didSelectRowAtIndexPath:nil];
}

-(void)testTableViewDidSelectRowAtNilIndexPathWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    [delegate tableView:mockTableView didSelectRowAtIndexPath:nil];

    //then
    [mockTableView verify];
}

-(void)testNilTableViewDidSelectRowAtIndexPathWithNilManager
{
    //given
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    [delegate tableView:nil didSelectRowAtIndexPath:mockIndexPath];

    //then
    [mockIndexPath verify];
}

-(void)testTableViewDidSelectRowAtIndexPathWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<UITableViewDelegate> delegate = [ERNTableViewDelegate createWithTableViewManager:nil];

    //when
    [delegate tableView:mockTableView didSelectRowAtIndexPath:nil];

    //then
    [mockTableView verify];
    [mockIndexPath verify];
}








-(void)testNilTableViewHeightForRowAtNilIndexPathWithManager
{
    //given
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    CGFloat height = [delegate tableView:nil
                 heightForRowAtIndexPath:nil];

    //then
    assertThatFloat(height, equalToFloat(0));
    [mockTableViewManager verify];
}

-(void)testTableViewHeightForRowAtNilIndexPathWithManager
{
    //given
    CGFloat expectedHeight = 45.0f;
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    [[[mockTableView expect] andReturnValue:OCMOCK_VALUE(expectedHeight)] rowHeight];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    CGFloat height = [delegate tableView:mockTableView
                 heightForRowAtIndexPath:nil];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockTableView verify];
    [mockTableViewManager verify];
}

-(void)testNilTableViewHeightForRowAtIndexPathWithManager
{
    //given
    CGFloat expectedHeight = 45.0f;
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    [[[mockTableViewManager expect] andReturnValue:OCMOCK_VALUE(expectedHeight)]
     heightForRowAtIndexPath:mockIndexPath
     defaultHeight:0.0f];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    CGFloat height = [delegate tableView:nil
                 heightForRowAtIndexPath:mockIndexPath];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockIndexPath verify];
    [mockTableViewManager verify];
}

-(void)testTableViewHeightForRowAtIndexPathWithManager
{
    //given
    CGFloat expectedHeight = 45.0f;
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    [[[mockTableView expect] andReturnValue:OCMOCK_VALUE(expectedHeight)] rowHeight];
    [[[mockTableViewManager expect] andReturnValue:OCMOCK_VALUE(expectedHeight)]
     heightForRowAtIndexPath:mockIndexPath
     defaultHeight:expectedHeight];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    CGFloat height = [delegate tableView:mockTableView
                 heightForRowAtIndexPath:mockIndexPath];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockIndexPath verify];
    [mockTableView verify];
    [mockTableViewManager verify];
}

-(void)testNilTableViewHeightForHeaderInSectionWithManager
{
    //given
    NSInteger section = 43;
    CGFloat expectedHeight = 33.0f;
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect]
     andReturnValue:OCMOCK_VALUE(expectedHeight)] heightForHeaderInSection:section
     defaultHeight:0.0f];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    CGFloat height = [delegate tableView:nil
                heightForHeaderInSection:section];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockTableViewManager verify];
}

-(void)testTableViewHeightForHeaderInSectionWithManager
{
    //given
    NSInteger section = 43;
    CGFloat expectedHeight = 33.0f;
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect]
     andReturnValue:OCMOCK_VALUE(expectedHeight)] heightForHeaderInSection:section
     defaultHeight:0.0f];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    CGFloat height = [delegate tableView:mockTableView
                heightForHeaderInSection:section];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockTableView verify];
    [mockTableViewManager verify];
}

-(void)testNilTableViewHeightForFooterInSectionWithManager
{
    //given
    NSInteger section = 43;
    CGFloat expectedHeight = 33.0f;
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect]
     andReturnValue:OCMOCK_VALUE(expectedHeight)] heightForFooterInSection:section
     defaultHeight:0.0f];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    CGFloat height = [delegate tableView:nil
                heightForFooterInSection:section];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockTableViewManager verify];
}

-(void)testTableViewHeightForFooterInSectionWithManager
{
    //given
    NSInteger section = 43;
    CGFloat expectedHeight = 33.0f;
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect]
     andReturnValue:OCMOCK_VALUE(expectedHeight)] heightForFooterInSection:section
     defaultHeight:0.0f];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    CGFloat height = [delegate tableView:mockTableView
                heightForFooterInSection:section];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockTableView verify];
    [mockTableViewManager verify];
}

-(void)testNilTableViewViewForHeaderInSectionWithManager
{
    //given
    NSInteger expectedSection = 34;
    id mockView = [OCMockObject mockForClass:[UIView class]];
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect] andReturn:mockView] viewForHeaderInSection:expectedSection];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    UIView *view = [delegate tableView:nil
                viewForHeaderInSection:expectedSection];

    //then
    assertThat(view, equalTo(mockView));
    [mockTableViewManager verify];
}

-(void)testTableViewViewForHeaderInSectionWithManager
{
    //given
    NSInteger expectedSection = 34;
    id mockView = [OCMockObject mockForClass:[UIView class]];
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect] andReturn:mockView] viewForHeaderInSection:expectedSection];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    UIView *view = [delegate tableView:mockTableView
                viewForHeaderInSection:expectedSection];

    //then
    assertThat(view, equalTo(mockView));
    [mockTableView verify];
    [mockTableViewManager verify];
}

-(void)testNilTableViewViewForFooterInSectionWithManager
{
    //given
    NSInteger expectedSection = 34;
    id mockView = [OCMockObject mockForClass:[UIView class]];
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect] andReturn:mockView] viewForFooterInSection:expectedSection];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    UIView *view = [delegate tableView:nil
                viewForFooterInSection:expectedSection];

    //then
    assertThat(view, equalTo(mockView));
    [mockTableViewManager verify];
}

-(void)testTableViewViewForFooterInSectionWithManager
{
    //given
    NSInteger expectedSection = 34;
    id mockView = [OCMockObject mockForClass:[UIView class]];
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect] andReturn:mockView] viewForFooterInSection:expectedSection];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    UIView *view = [delegate tableView:mockTableView
                viewForFooterInSection:expectedSection];

    //then
    assertThat(view, equalTo(mockView));
    [mockTableView verify];
    [mockTableViewManager verify];
}

-(void)testNilTableViewDidSelectRowAtNilIndexPathWithManager
{
    //given
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    [delegate tableView:nil didSelectRowAtIndexPath:nil];

    //then
    [mockTableViewManager verify];
}

-(void)testTableViewDidSelectRowAtNilIndexPathWithManager
{
    //given
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    [delegate tableView:mockTableView didSelectRowAtIndexPath:nil];

    //then
    [mockTableView verify];
    [mockTableViewManager verify];
}

-(void)testNilTableViewDidSelectRowAtIndexPathWithManager
{
    //given
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[mockTableViewManager expect] actionForIndexPath:mockIndexPath];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    [delegate tableView:nil didSelectRowAtIndexPath:mockIndexPath];

    //then
    [mockIndexPath verify];
    [mockTableViewManager verify];
}

-(void)testTableViewDidSelectRowAtIndexPathWithManager
{
    //given
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<UITableViewDelegate> delegate =
    [ERNTableViewDelegate createWithTableViewManager:mockTableViewManager];

    //when
    [delegate tableView:mockTableView didSelectRowAtIndexPath:nil];
    
    //then
    [mockTableView verify];
    [mockIndexPath verify];
    [mockTableViewManager verify];
}

@end
