#import "ERNTableViewController+Refreshable.h"
#import "ERNRefreshControlRepositoryRefreshController.h"
#import "ERNAsyncItemsRepository.h"
#import "UIViewController+ERNHelper.h"

@implementation ERNTableViewController (Refreshable)

+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   itemManager:(id<ERNTableViewItemManager>)itemManager
{
    return [self setupRefreshController:
            [ERNTableViewController createWithRepository:repository
                                             itemManager:itemManager]
                             repository:repository];
}

+(instancetype)setupRefreshController:(ERNTableViewController *)tableViewController
                           repository:(id<ERNAsyncRepository>)repository
{
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    ERNRefreshControlRepositoryRefreshController *refreshController =
    [ERNRefreshControlRepositoryRefreshController createWithRefreshControl:refreshControl
                                                                repository:repository];
    [tableViewController setRefreshControl:refreshControl];
    [tableViewController ERN_addMicroController:refreshController];
    return tableViewController;
}

@end
