#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNMergingTableViewManagerTest.h"
#import "ERNMergingTableViewManager.h"

@implementation ERNMergingTableViewManagerTest
-(void)testNilTableViewCellForNilIndexPathNilFirstNilRest
{
    //given
    id<ERNTableViewManager> manager =
    [ERNMergingTableViewManager createWithFirstTableViewManager:nil
                                           restTableViewManager:nil];

    //when
    UITableViewCell *cell = [manager cellForIndexPath:nil
                                           cellReuser:nil];

    //then
    assertThat(cell, notNilValue());
}

-(void)testSectionsNilFirstNilRest
{
    //given
    id<ERNTableViewManager> manager =
    [ERNMergingTableViewManager createWithFirstTableViewManager:nil
                                           restTableViewManager:nil];

    //when
    NSInteger sections = [manager sections];

    //then
    assertThatInteger(sections, equalToInteger(0));
}

-(void)testRowsInSectionNilFirstNilRest
{
    //given
    id<ERNTableViewManager> manager =
    [ERNMergingTableViewManager createWithFirstTableViewManager:nil
                                           restTableViewManager:nil];

    //when
    NSInteger rows = [manager rowsInSection:3];

    //then
    assertThatInteger(rows, equalToInteger(0));
}

-(void)testActionForNilIndexPathNilFirstNilRest
{
    //given
    id<ERNTableViewManager> manager =
    [ERNMergingTableViewManager createWithFirstTableViewManager:nil
                                           restTableViewManager:nil];

    //when
    [manager actionForIndexPath:nil];
}

-(void)testTitleForFooterInSectionNilFirstNilRest
{
    //given
    id<ERNTableViewManager> manager =
    [ERNMergingTableViewManager createWithFirstTableViewManager:nil
                                           restTableViewManager:nil];

    //when
    NSString *title = [manager titleForFooterInSection:20];

    //then
    assertThat(title, equalTo(@""));
}

-(void)testTitleForHeaderInSectionNilFirstNilRest
{
    //given
    id<ERNTableViewManager> manager =
    [ERNMergingTableViewManager createWithFirstTableViewManager:nil
                                           restTableViewManager:nil];

    //when
    NSString *title = [manager titleForHeaderInSection:20];

    //then
    assertThat(title, equalTo(@""));
}

-(void)testHeightForRowAtNilIndexPathDefaultHeightNilFirstNilRest
{
    //given
    CGFloat defaultHeight = 40.0f;
    id<ERNTableViewManager> manager =
    [ERNMergingTableViewManager createWithFirstTableViewManager:nil
                                           restTableViewManager:nil];

    //when
    CGFloat height = [manager heightForRowAtIndexPath:nil
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(defaultHeight, equalToFloat(height));
}


-(void)testHeightForHeaderInSectionDefaultHeightNilFirstNilRest
{
    //given
    CGFloat defaultHeight = 40.0f;
    id<ERNTableViewManager> manager =
    [ERNMergingTableViewManager createWithFirstTableViewManager:nil
                                           restTableViewManager:nil];

    //when
    CGFloat height = [manager heightForHeaderInSection:22
                                         defaultHeight:defaultHeight];

    //then
    assertThatFloat(defaultHeight, equalToFloat(height));
}

-(void)testHeightForFooterInSectionDefaultHeightNilFirstNilRest
{
    //given
    CGFloat defaultHeight = 40.0f;
    id<ERNTableViewManager> manager =
    [ERNMergingTableViewManager createWithFirstTableViewManager:nil
                                           restTableViewManager:nil];

    //when
    CGFloat height = [manager heightForFooterInSection:22
                                         defaultHeight:defaultHeight];

    //then
    assertThatFloat(defaultHeight, equalToFloat(height));
}

-(void)testViewForHeaderInSectionDefaultHeightNilFirstNilRest
{
    //given
    id<ERNTableViewManager> manager =
    [ERNMergingTableViewManager createWithFirstTableViewManager:nil
                                           restTableViewManager:nil];

    //when
    UIView *view = [manager viewForHeaderInSection:22];

    //then
    assertThat(view, nilValue());
}

-(void)testViewForFooterInSectionDefaultHeightNilFirstNilRest
{
    //given
    id<ERNTableViewManager> manager =
    [ERNMergingTableViewManager createWithFirstTableViewManager:nil
                                           restTableViewManager:nil];

    //when
    UIView *view = [manager viewForFooterInSection:22];
    
    //then
    assertThat(view, nilValue());
}
@end
