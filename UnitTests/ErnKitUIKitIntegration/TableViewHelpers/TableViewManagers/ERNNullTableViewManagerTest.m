#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullTableViewManagerTest.h"
#import "ERNNullTableViewManager.h"

@implementation ERNNullTableViewManagerTest

-(void)testSingleton
{
    //given, when
    id<ERNTableViewManager> tableViewManager1 = [ERNNullTableViewManager create];
    id<ERNTableViewManager> tableViewManager2 = [ERNNullTableViewManager create];

    //then
    assertThat(tableViewManager1, notNilValue());
    assertThat(tableViewManager1, equalTo(tableViewManager2));
}

-(void)testNilTableViewCellForNilIndexPath
{
    //given
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    UITableViewCell *cell = [tableViewManager tableView:nil
                                       cellForIndexPath:nil];

    //then
    assertThat(cell, notNilValue());
}

-(void)testSections
{
    //given
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    NSInteger sections = [tableViewManager sections];

    //then
    assertThatInteger(sections, equalToInteger(0));
}

-(void)testRowsInSection
{
    //given
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    NSInteger rows = [tableViewManager rowsInSection:0];

    //then
    assertThatInteger(rows, equalToInteger(0));
}

-(void)testTableViewCellForNilIndexPath
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    UITableViewCell *cell = [tableViewManager tableView:mockTableView
                                       cellForIndexPath:nil];

    //then
    assertThat(cell, notNilValue());
    [mockTableView verify];
}

-(void)testNilTableViewCellForIndexPath
{
    //given
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    UITableViewCell *cell = [tableViewManager tableView:nil
                                       cellForIndexPath:mockIndexPath];

    //then
    assertThat(cell, notNilValue());
    [mockIndexPath verify];
}

-(void)testTableViewCellForIndexPath
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    UITableViewCell *cell = [tableViewManager tableView:mockTableView
                                       cellForIndexPath:mockIndexPath];

    //then
    assertThat(cell, notNilValue());
    [mockTableView verify];
    [mockIndexPath verify];
}

@end
