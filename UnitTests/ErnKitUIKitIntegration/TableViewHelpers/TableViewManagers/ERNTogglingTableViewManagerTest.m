#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTogglingTableViewManagerTest.h"
#import "ERNTogglingTableViewManager.h"
#import "ERNTogglerTest.h"

@implementation ERNTogglingTableViewManagerTest {
}

#pragma mark - ERNToggler protocol tests

-(void)testTogglerProtocolWithNilTableViewManagersNilTableView
{
    [ERNTogglerTest testToggler:
     [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                    tableView:nil]];
}

#pragma mark - class tests

-(void)testNilTableViewCellForNilIndexPathNilManagersNilTableView
{
    //given
    id<ERNTableViewManager> manager =
    [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                   tableView:nil];

    //when
    UITableViewCell *cell = [manager tableView:nil
                              cellForIndexPath:nil];

    //then
    assertThat(cell, notNilValue());
}

-(void)testSectionsNilManagersNilTableView
{
    //given
    id<ERNTableViewManager> manager =
    [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                   tableView:nil];

    //when
    NSInteger sections = [manager sections];

    //then
    assertThatInteger(sections, equalToInteger(0));
}

-(void)testRowsInSectionNilManagersNilTableView
{
    //given
    id<ERNTableViewManager> manager =
    [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                   tableView:nil];

    //when
    NSInteger rows = [manager rowsInSection:3];

    //then
    assertThatInteger(rows, equalToInteger(0));
}

-(void)testActionForNilIndexPathNilManagersNilTableView
{
    //given
    id<ERNTableViewManager> manager =
    [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                   tableView:nil];

    //when
    [manager actionForIndexPath:nil];
}

-(void)testTitleForFooterInSectionNilManagersNilTableView
{
    //given
    id<ERNTableViewManager> manager =
    [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                   tableView:nil];

    //when
    NSString *title = [manager titleForFooterInSection:20];

    //then
    assertThat(title, equalTo(@""));
}

-(void)testTitleForHeaderInSectionNilManagersNilTableView
{
    //given
    id<ERNTableViewManager> manager =
    [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                   tableView:nil];

    //when
    NSString *title = [manager titleForHeaderInSection:20];

    //then
    assertThat(title, equalTo(@""));
}

-(void)testHeightForRowAtNilIndexPathDefaultHeightNilManagersNilTableView
{
    //given
    CGFloat defaultHeight = 40.0f;
    id<ERNTableViewManager> manager =
    [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                   tableView:nil];

    //when
    CGFloat height = [manager heightForRowAtIndexPath:nil
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(defaultHeight, equalToFloat(height));
}


-(void)testHeightForHeaderInSectionDefaultHeightNilManagersNilTableView
{
    //given
    CGFloat defaultHeight = 40.0f;
    id<ERNTableViewManager> manager =
    [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                   tableView:nil];

    //when
    CGFloat height = [manager heightForHeaderInSection:22
                                         defaultHeight:defaultHeight];

    //then
    assertThatFloat(defaultHeight, equalToFloat(height));
}

-(void)testHeightForFooterInSectionDefaultHeightNilManagersNilTableView
{
    //given
    CGFloat defaultHeight = 40.0f;
    id<ERNTableViewManager> manager =
    [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                   tableView:nil];

    //when
    CGFloat height = [manager heightForFooterInSection:22
                                         defaultHeight:defaultHeight];

    //then
    assertThatFloat(defaultHeight, equalToFloat(height));
}

-(void)testViewForHeaderInSectionDefaultHeightNilManagersNilTableView
{
    //given
    id<ERNTableViewManager> manager =
    [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                   tableView:nil];

    //when
    UIView *view = [manager viewForHeaderInSection:22];

    //then
    assertThat(view, nilValue());
}

-(void)testViewForFooterInSectionDefaultHeightNilManagersNilTableView
{
    //given
    id<ERNTableViewManager> manager =
    [ERNTogglingTableViewManager createWithTableViewManagers:nil
                                                   tableView:nil];

    //when
    UIView *view = [manager viewForFooterInSection:22];
    
    //then
    assertThat(view, nilValue());
}

@end
