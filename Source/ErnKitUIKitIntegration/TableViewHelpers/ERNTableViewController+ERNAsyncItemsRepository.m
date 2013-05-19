#import "ERNTableViewController+ERNAsyncItemsRepository.h"
#import "ERNRefreshControlRepositoryRefreshController.h"
#import "ERNTableViewRepositoryRefreshController.h"
#import "ERNAsyncPaginatedItemsRepository.h"
#import "UIViewController+ERNHelper.h"
#import "ERNTableViewItemManager.h"
#import "ERNAsyncItemsRepositoryTableViewManager.h"

@implementation ERNTableViewController (ERNAsyncItemsRepository)

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                        itemManager:(id<ERNTableViewItemManager>)itemManager
{
    return [self setupTableViewRefreshController:
            [ERNTableViewController createWithTableViewManager:
             [ERNAsyncItemsRepositoryTableViewManager createWithRepository:repository
                                                               itemManager:itemManager]]
                                      repository:repository];
}

+(instancetype)createRefreshableWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                                   itemManager:(id<ERNTableViewItemManager>)itemManager
{
    return [self setupRefreshControlRefreshController:
            [ERNTableViewController createWithRepository:repository
                                             itemManager:itemManager]
                             repository:repository];
}

#pragma mark - private

+(instancetype)setupTableViewRefreshController:(ERNTableViewController *)tableViewController
                                    repository:(id<ERNAsyncRepository>)repository
{
    ERNTableViewRepositoryRefreshController *controller =
    [ERNTableViewRepositoryRefreshController createWithTableView:[tableViewController tableView]
                                                      repository:repository];
    [tableViewController ERN_addMicroController:controller];
    return tableViewController;
}

+(instancetype)setupRefreshControlRefreshController:(ERNTableViewController *)tableViewController
                                         repository:(id<ERNAsyncRepository>)repository
{
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    ERNRefreshControlRepositoryRefreshController *controller =
    [ERNRefreshControlRepositoryRefreshController createWithRefreshControl:refreshControl
                                                                repository:repository];
    [tableViewController setRefreshControl:refreshControl];
    [tableViewController ERN_addMicroController:controller];
    return tableViewController;
}

@end
