#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTableViewControllerTest.h"
#import "ERNTableViewController.h"
#import "ERNTableViewController+Refreshable.h"
#import "ERNAsyncItemsRepository.h"

@interface ERNTableViewController ()
-(void)repositoryRefreshed;
@end

@implementation ERNTableViewControllerTest

-(void)testViewDidLoadNilRepositoryNilCellFactory
{
    //given
    ERNTableViewController *viewController = [ERNTableViewController createWithRepository:nil
                                              cellFactory:nil];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
}

-(void)testViewDidLoadRepositoryNilCellFactory
{
    //given
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:mockRepository
                                     cellFactory:nil];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
    [mockRepository verify];
}

-(void)testViewDidLoadNilRepositoryCellFactory
{
    //given
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:nil
                                     cellFactory:mockCellFactory];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
}

-(void)testViewDidLoadRepositoryCellFactory
{
    //given
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:mockRepository
                                     cellFactory:mockCellFactory];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
    [mockRepository verify];
}

-(void)testRefreshableViewDidLoadNilRepositoryNilCellFactory
{
    //given
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:nil
                                                cellFactory:nil];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
}

-(void)testRefreshableViewDidLoadRepositoryNilCellFactory
{
    //given
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:mockRepository
                                                cellFactory:nil];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
    [mockRepository verify];
}

-(void)testRefreshableViewDidLoadNilRepositoryCellFactory
{
    //given
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:nil
                                                cellFactory:mockCellFactory];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
}

-(void)testRefreshableViewDidLoadRepositoryCellFactory
{
    //given
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:mockRepository
                                                cellFactory:mockCellFactory];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
    [mockRepository verify];
}

-(void)testViewDidLoadNilRepositoryNilCellFactoryNilActionHandler
{
    //given
    ERNTableViewController *viewController = [ERNTableViewController createWithRepository:nil
                                                                              cellFactory:nil
                                                                            actionHandler:nil];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
}

-(void)testViewDidLoadRepositoryNilCellFactoryNilActionHandler
{
    //given
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:mockRepository
                                     cellFactory:nil
                                   actionHandler:nil];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
    [mockRepository verify];
}

-(void)testViewDidLoadNilRepositoryCellFactoryNilActionHandler
{
    //given
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:nil
                                     cellFactory:mockCellFactory
                                   actionHandler:nil];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
}

-(void)testViewDidLoadRepositoryCellFactoryNilActionHandler
{
    //given
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:mockRepository
                                     cellFactory:mockCellFactory
                                   actionHandler:nil];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
    [mockRepository verify];
}

-(void)testRefreshableViewDidLoadNilRepositoryNilCellFactoryNilActionHandler
{
    //given
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:nil
                                                cellFactory:nil
                                              actionHandler:nil];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
}

-(void)testRefreshableViewDidLoadRepositoryNilCellFactoryNilActionHandler
{
    //given
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:mockRepository
                                                cellFactory:nil
                                              actionHandler:nil];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
    [mockRepository verify];
}

-(void)testRefreshableViewDidLoadNilRepositoryCellFactoryNilActionHandler
{
    //given
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:nil
                                                cellFactory:mockCellFactory
                                              actionHandler:nil];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
}

-(void)testRefreshableViewDidLoadRepositoryCellFactoryNilActionHandler
{
    //given
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:mockRepository
                                                cellFactory:mockCellFactory
                                              actionHandler:nil];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
    [mockRepository verify];
}

-(void)testViewDidLoadNilRepositoryNilCellFactoryActionHandler
{
    //given
    id mockActionHandler = [OCMockObject niceMockForProtocol:@protocol(ERNActionHandler)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:nil
                                     cellFactory:nil
                                   actionHandler:mockActionHandler];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
}

-(void)testViewDidLoadRepositoryNilCellFactoryActionHandler
{
    //given
    id mockActionHandler = [OCMockObject niceMockForProtocol:@protocol(ERNActionHandler)];
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:mockRepository
                                     cellFactory:nil
                                   actionHandler:mockActionHandler];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
    [mockRepository verify];
}

-(void)testViewDidLoadNilRepositoryCellFactoryActionHandler
{
    //given
    id mockActionHandler = [OCMockObject niceMockForProtocol:@protocol(ERNActionHandler)];
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:nil
                                     cellFactory:mockCellFactory
                                   actionHandler:mockActionHandler];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
}

-(void)testViewDidLoadRepositoryCellFactoryActionHandler
{
    //given
    id mockActionHandler = [OCMockObject niceMockForProtocol:@protocol(ERNActionHandler)];
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createWithRepository:mockRepository
                                     cellFactory:mockCellFactory
                                   actionHandler:mockActionHandler];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], nilValue());
    [mockRepository verify];
}

-(void)testRefreshableViewDidLoadNilRepositoryNilCellFactoryActionHandler
{
    //given
    id mockActionHandler = [OCMockObject niceMockForProtocol:@protocol(ERNActionHandler)];
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:nil
                                                cellFactory:nil
                                              actionHandler:mockActionHandler];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
}

-(void)testRefreshableViewDidLoadRepositoryNilCellFactoryActionHandler
{
    //given
    id mockActionHandler = [OCMockObject niceMockForProtocol:@protocol(ERNActionHandler)];
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:mockRepository
                                                cellFactory:nil
                                              actionHandler:mockActionHandler];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
    [mockRepository verify];
}

-(void)testRefreshableViewDidLoadNilRepositoryCellFactoryActionHandler
{
    //given
    id mockActionHandler = [OCMockObject niceMockForProtocol:@protocol(ERNActionHandler)];
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:nil
                                                cellFactory:mockCellFactory
                                              actionHandler:mockActionHandler];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
}

-(void)testRefreshableViewDidLoadRepositoryCellFactoryActionHandler
{
    //given
    id mockActionHandler = [OCMockObject niceMockForProtocol:@protocol(ERNActionHandler)];
    id mockCellFactory = [OCMockObject niceMockForProtocol:@protocol(ERNTableViewCellFactory)];
    id mockRepository = [OCMockObject niceMockForProtocol:@protocol(ERNAsyncItemsRepository)];
    ERNTableViewController *viewController =
    [ERNTableViewController createRefreshableWithRepository:mockRepository
                                                cellFactory:mockCellFactory
                                              actionHandler:mockActionHandler];
    [[mockRepository expect] addObserver:viewController
                                selector:NSSelectorFromString(@"repositoryRefreshed")];

    //when
    [viewController viewDidLoad];

    //then
    assertThat([[viewController tableView] delegate], notNilValue());
    assertThat([[viewController tableView] dataSource], notNilValue());
    assertThat([viewController refreshControl], notNilValue());
    [mockRepository verify];
}

@end
