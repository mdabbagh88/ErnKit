#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTableViewControllerTest.h"
#import "ERNTableViewController.h"
#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNTableViewItemManager.h"

@interface ERNTableViewController ()
-(void)repositoryRefreshed;
@end

@implementation ERNTableViewControllerTest

-(void)testViewDidLoadNilTableViewManager
{
    //given
    ERNTableViewController *viewController =
    [ERNTableViewController createWithTableViewManager:nil];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
}

-(void)testViewDidLoadTableViewManager
{
    //given
    id mockTableViewManager =
    [OCMockObject niceMockForProtocol:@protocol(ERNTableViewItemManager)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithTableViewManager:mockTableViewManager];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    [mockTableViewManager verify];
}

-(void)testSetTableView
{
    //given
    id mockTableView =
    [OCMockObject niceMockForClass:[UITableView class]];
    id mockTableViewManager =
    [OCMockObject niceMockForProtocol:@protocol(ERNTableViewItemManager)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithTableViewManager:mockTableViewManager];

    //when
    [viewController setTableView:mockTableView];

    //then
    assertThat([viewController tableView], equalTo(mockTableView));
    [mockTableViewManager verify];
}

@end
