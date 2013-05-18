#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTableViewDataSourceTest.h"
#import "ERNTableViewDataSource.h"
#import "ERNNullTableViewCell.h"
#import "ERNTableViewManager.h"

@implementation ERNTableViewDataSourceTest

-(void)testCellForRowAtNilIndexPathNilTableViewWithNilManager
{
    //given
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    UITableViewCell *cell = [dataSource tableView:nil
                            cellForRowAtIndexPath:nil];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
}

-(void)testCellForRowAtNilIndexPathTableViewWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    UITableViewCell *cell = [dataSource tableView:mockTableView
                            cellForRowAtIndexPath:nil];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
    [mockTableView verify];
}

-(void)testCellForRowAtIndexPathNilTableViewWithNilManager
{
    //given
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    UITableViewCell *cell = [dataSource tableView:nil
                            cellForRowAtIndexPath:mockIndexPath];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
    [mockIndexPath verify];
}

-(void)testCellForRowAtIndexPathTableViewWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    UITableViewCell *cell = [dataSource tableView:mockTableView
                            cellForRowAtIndexPath:mockIndexPath];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
    [mockTableView verify];
    [mockIndexPath verify];
}

-(void)testNumberOfSectionsInNilTableViewWithNilManager
{
    //given
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    NSInteger sections = [dataSource numberOfSectionsInTableView:nil];

    //then
    assertThatInteger(sections, equalToInteger(0));
}

-(void)testNumberOfSectionsInTableViewWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    NSInteger sections = [dataSource numberOfSectionsInTableView:mockTableView];

    //then
    assertThatInteger(sections, equalToInteger(0));
    [mockTableView verify];
}

-(void)testNumberOfRowsInSectionsInNilTableViewWithNilManager
{
    //given
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    NSInteger rows = [dataSource tableView:nil
                     numberOfRowsInSection:23];

    //then
    assertThatInteger(rows, equalToInteger(0));
}


-(void)testNumberOfRowsInSectionsInTableViewWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    NSInteger rows = [dataSource tableView:mockTableView
                     numberOfRowsInSection:23];

    //then
    assertThatInteger(rows, equalToInteger(0));
    [mockTableView verify];
}

-(void)testTitleForFooterInSectionInNilTableViewWithNilManager
{
    //given
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    NSString *title = [dataSource tableView:nil
                   titleForFooterInSection:21];

    //then
    assertThat(title, equalTo(@""));
}

-(void)testTitleForFooterInSectionInTableViewWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    NSString *title = [dataSource tableView:mockTableView
                    titleForFooterInSection:21];

    //then
    assertThat(title, equalTo(@""));
    [mockTableView verify];
}

-(void)testTitleForHeaderInSectionInNilTableViewWithNilManager
{
    //given
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    NSString *title = [dataSource tableView:nil
                    titleForHeaderInSection:21];

    //then
    assertThat(title, equalTo(@""));
}

-(void)testTitleForHeaderInSectionInTableViewWithNilManager
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:nil];

    //when
    NSString *title = [dataSource tableView:mockTableView
                    titleForHeaderInSection:21];

    //then
    assertThat(title, equalTo(@""));
    [mockTableView verify];
}

-(void)testCellForRowAtNilIndexPathNilTableViewWithManager
{
    //given
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    UITableViewCell *cell = [dataSource tableView:nil
                            cellForRowAtIndexPath:nil];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
    [mockTableViewManager verify];
}

-(void)testCellForRowAtNilIndexPathTableViewWithManager
{
    //given
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    UITableViewCell *cell = [dataSource tableView:mockTableView
                            cellForRowAtIndexPath:nil];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
    [mockTableView verify];
    [mockTableViewManager verify];
}

-(void)testCellForRowAtIndexPathNilTableViewWithManager
{
    //given
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    UITableViewCell *cell = [dataSource tableView:nil
                            cellForRowAtIndexPath:mockIndexPath];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
    [mockIndexPath verify];
    [mockTableViewManager verify];
}

-(void)testCellForRowAtIndexPathTableViewWithManager
{
    //given
    id mockCell = [OCMockObject mockForClass:[UITableViewCell class]];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect] andReturn:mockCell] tableView:mockTableView
                                                 cellForIndexPath:mockIndexPath];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    UITableViewCell *cell = [dataSource tableView:mockTableView
                            cellForRowAtIndexPath:mockIndexPath];

    //then
    assertThat(cell, equalTo(mockCell));
    [mockTableView verify];
    [mockTableViewManager verify];
    [mockIndexPath verify];
}

-(void)testNumberOfSectionsInNilTableViewWithManager
{
    //given
    NSInteger expectedSection = 34;
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect] andReturnValue:OCMOCK_VALUE(expectedSection)] sections];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    NSInteger sections = [dataSource numberOfSectionsInTableView:nil];

    //then
    assertThatInteger(sections, equalToInteger(expectedSection));
    [mockTableViewManager verify];
}

-(void)testNumberOfSectionsInTableViewWithManager
{
    //given
    NSInteger expectedSection = 23;
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect] andReturnValue:OCMOCK_VALUE(expectedSection)] sections];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    NSInteger sections = [dataSource numberOfSectionsInTableView:mockTableView];

    //then
    assertThatInteger(sections, equalToInteger(expectedSection));
    [mockTableView verify];
    [mockTableViewManager verify];
}

-(void)testNumberOfRowsInSectionsInNilTableViewWithManager
{
    //given
    NSInteger expectedRows = 43;
    NSInteger expectedSection = 23;
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect]
      andReturnValue:OCMOCK_VALUE(expectedRows)] rowsInSection:expectedSection];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    NSInteger rows = [dataSource tableView:nil
                     numberOfRowsInSection:expectedSection];

    //then
    assertThatInteger(rows, equalToInteger(expectedRows));
    [mockTableViewManager verify];
}

-(void)testNumberOfRowsInSectionsInTableViewWithManager
{
    //given
    NSInteger expectedRows = 43;
    NSInteger expectedSection = 23;
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect]
      andReturnValue:OCMOCK_VALUE(expectedRows)] rowsInSection:expectedSection];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    NSInteger rows = [dataSource tableView:mockTableView
                     numberOfRowsInSection:expectedSection];

    //then
    assertThatInteger(rows, equalToInteger(expectedRows));
    [mockTableView verify];
    [mockTableViewManager verify];
}

-(void)testTitleForFooterInSectionInNilTableViewWithManager
{
    //given
    NSInteger expectedSection = 23;
    NSString *expectedTitle = @"expectedTitle";
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect]
      andReturn:expectedTitle] titleForFooterInSection:expectedSection];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    NSString *title = [dataSource tableView:nil
                    titleForFooterInSection:expectedSection];

    //then
    assertThat(title, equalTo(expectedTitle));
    [mockTableViewManager verify];
}

-(void)testTitleForFooterInSectionInTableViewWithManager
{
    //given
    NSInteger expectedSection = 23;
    NSString *expectedTitle = @"expectedTitle";
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect]
      andReturn:expectedTitle] titleForFooterInSection:expectedSection];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    NSString *title = [dataSource tableView:mockTableView
                    titleForFooterInSection:expectedSection];

    //then
    assertThat(title, equalTo(expectedTitle));
    [mockTableView verify];
    [mockTableViewManager verify];
}

-(void)testTitleForHeaderInSectionInNilTableViewWithManager
{
    //given
    NSInteger expectedSection = 23;
    NSString *expectedTitle = @"expectedTitle";
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect]
      andReturn:expectedTitle] titleForHeaderInSection:expectedSection];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    NSString *title = [dataSource tableView:nil
                    titleForHeaderInSection:expectedSection];

    //then
    assertThat(title, equalTo(expectedTitle));
    [mockTableViewManager verify];
}

-(void)testTitleForHeaderInSectionInTableViewWithManager
{
    //given
    NSInteger expectedSection = 23;
    NSString *expectedTitle = @"expectedTitle";
    id mockTableViewManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewManager)];
    [[[mockTableViewManager expect]
      andReturn:expectedTitle] titleForHeaderInSection:expectedSection];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<UITableViewDataSource> dataSource =
    [ERNTableViewDataSource createWithTableViewManager:mockTableViewManager];

    //when
    NSString *title = [dataSource tableView:mockTableView
                    titleForHeaderInSection:expectedSection];
    
    //then
    assertThat(title, equalTo(expectedTitle));
    [mockTableView verify];
    [mockTableViewManager verify];
}

@end
