#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullTableViewDataSourceTest.h"
#import "ERNNullTableViewDataSource.h"
#import "ERNNullTableViewCell.h"

@implementation ERNNullTableViewDataSourceTest {
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<UITableViewDataSource> tableViewDataSource1 = [ERNNullTableViewDataSource create];
    id<UITableViewDataSource> tableViewDataSource2 = [ERNNullTableViewDataSource create];

    //then
    assertThat(tableViewDataSource1, notNilValue());
    assertThat(tableViewDataSource1, equalTo(tableViewDataSource2));
}

-(void)testNumberOfRowsInSectionNilTableViewSectionZero
{
    id<UITableViewDataSource> tableViewDataSource = [ERNNullTableViewDataSource create];
    NSInteger rows = [tableViewDataSource tableView:nil numberOfRowsInSection:0];
    assertThatInteger(rows, equalToInteger(0));
}

-(void)testNumberOfRowsInSectionTableViewSectionZero
{
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> tableViewDataSource = [ERNNullTableViewDataSource create];
    NSInteger rows = [tableViewDataSource tableView:mockTableView numberOfRowsInSection:0];
    assertThatInteger(rows, equalToInteger(0));
}

-(void)testNumberOfRowsInSectionNilTableViewSectionMax
{
    id<UITableViewDataSource> tableViewDataSource = [ERNNullTableViewDataSource create];
    NSInteger rows = [tableViewDataSource tableView:nil numberOfRowsInSection:INT_MAX];
    assertThatInteger(rows, equalToInteger(0));
}

-(void)testNumberOfRowsInSectionTableViewSectionMax
{
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> tableViewDataSource = [ERNNullTableViewDataSource create];
    NSInteger rows = [tableViewDataSource tableView:mockTableView numberOfRowsInSection:INT_MAX];
    assertThatInteger(rows, equalToInteger(0));
}

-(void)testCellForRowAtNilIndexPathNilTableView
{
    id<UITableViewDataSource> tableViewDataSource = [ERNNullTableViewDataSource create];
    UITableViewCell *cell = [tableViewDataSource tableView:nil cellForRowAtIndexPath:nil];
    assertThat(cell, instanceOf([ERNNullTableViewCell class]));
}

-(void)testCellForRowAtNilIndexPathTableView
{
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> tableViewDataSource = [ERNNullTableViewDataSource create];
    UITableViewCell *cell = [tableViewDataSource tableView:mockTableView
                                     cellForRowAtIndexPath:nil];
    assertThat(cell, instanceOf([ERNNullTableViewCell class]));
}

-(void)testCellForRowAtIndexPathNilTableView
{
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<UITableViewDataSource> tableViewDataSource = [ERNNullTableViewDataSource create];
    UITableViewCell *cell = [tableViewDataSource tableView:nil
                                     cellForRowAtIndexPath:mockIndexPath];
    assertThat(cell, instanceOf([ERNNullTableViewCell class]));
}

-(void)testCellForRowAtIndexPathTableView
{
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<UITableViewDataSource> tableViewDataSource = [ERNNullTableViewDataSource create];
    UITableViewCell *cell = [tableViewDataSource tableView:mockTableView
                                     cellForRowAtIndexPath:mockIndexPath];
    assertThat(cell, instanceOf([ERNNullTableViewCell class]));
}

@end
