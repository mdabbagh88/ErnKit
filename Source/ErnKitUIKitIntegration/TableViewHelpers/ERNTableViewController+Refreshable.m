#import "ERNTableViewController+Refreshable.h"
#import "ERNRefreshControlRepositoryRefreshController.h"
#import "ERNAsyncItemsRepository.h"
#import "UIViewController+ERNHelper.h"

@implementation ERNTableViewController (Refreshable)
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [self setupRefreshController:
            [ERNTableViewController createWithRepository:repository]
                             repository:repository];
}

+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   cellFactory:(id<ERNTableViewCellFactory>)cellFactory
{
    return [self setupRefreshController:
            [ERNTableViewController createWithRepository:repository
                                             cellFactory:cellFactory]
                             repository:repository];
}

+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                 actionHandler:(id<ERNActionHandler>)actionHandler
{
    return [self setupRefreshController:
            [ERNTableViewController createWithRepository:repository
                                           actionHandler:actionHandler]
                             repository:repository];
}

+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                                 actionHandler:(id<ERNActionHandler>)actionHandler
{
    return [self setupRefreshController:
            [ERNTableViewController createWithRepository:repository
                                             cellFactory:cellFactory
                                           actionHandler:actionHandler]
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
