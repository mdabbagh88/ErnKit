#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTableViewControllerTest.h"
#import "ERNTableViewController.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNTableViewItemManager.h"

@interface ERNTableViewController ()
-(void)repositoryRefreshed;
@end

@implementation ERNTableViewControllerTest

-(void)testViewDidLoadNilRepositoryNilCellFactory
{
    //given
    ERNTableViewController *viewController = [ERNTableViewController createWithRepository:nil
                                                                              itemManager:nil];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
}

-(void)testViewDidLoadRepositoryNilCellFactory
{
    //given
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:mockRepository
                                     itemManager:nil];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    [mockRepository verify];
}

-(void)testViewDidLoadNilRepositoryCellFactory
{
    //given
    id mockTableViewItemManager =
    [OCMockObject niceMockForProtocol:@protocol(ERNTableViewItemManager)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:nil
                                     itemManager:mockTableViewItemManager];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    [mockTableViewItemManager verify];
}

-(void)testViewDidLoadRepositoryCellFactory
{
    //given
    id mockTableViewItemManager =
    [OCMockObject niceMockForProtocol:@protocol(ERNTableViewItemManager)];
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:mockRepository
                                     itemManager:mockTableViewItemManager];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    [mockRepository verify];
    [mockTableViewItemManager verify];
}

@end
