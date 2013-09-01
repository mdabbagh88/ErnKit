#import "ERNRefreshableListFactory.h"
#import "ERNRepositoryFactory.h"
#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNViewController.h"
#import "ERNRefreshAsyncRepositoryAction.h"
#import "ERNNullAction.h"
#import "ERNAsyncItemsRepositoryTableViewManager.h"
#import "ERNTableViewDelegate.h"
#import "ERNTableViewDataSource.h"
#import "ERNTableViewMicroController.h"
#import "ERNRefreshControlRepositoryRefreshController.h"
#import "ERNTableViewRepositoryRefreshController.h"
#import "UIViewController+ERNHelper.h"
#import "ERNErrorHandler.h"

@interface ERNRefreshableListFactory ()
@property (nonatomic, readonly) id<ERNRepositoryFactory> repositoryFactory;
@property (nonatomic, readonly) id<ERNTableViewItemManager> itemManager;
@property (nonatomic, readonly) NSString *title;
@end

@implementation ERNRefreshableListFactory {
}

#pragma mark - public - constructors

+(instancetype)createWithItemManager:(id<ERNTableViewItemManager>)itemManager
                   repositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
                               title:(NSString *)title
{
    return [[self alloc] initWithItemManager:itemManager
                           repositoryFactory:repositoryFactory
                                       title:title];
}

#pragma mark - ERNViewControllerFactory

-(UIViewController *)createViewControllerForResource:(ERNResource *)resource
                                           dismisser:(id<ERNViewControllerDismisser>) __unused dismisser
{
    id<ERNAsyncPaginatedItemsRepository> repository =
    [[self repositoryFactory] repositoryForResource:resource];

    id<ERNAction> appearAction = [ERNRefreshAsyncRepositoryAction createWithRepository:repository];
    id<ERNAction> disappearAction = [ERNNullAction create];

    ERNViewController *viewController = [ERNViewController createWithResource:resource
                                                                 appearAction:appearAction
                                                              disappearAction:disappearAction];
    [viewController setTitle:[self title]];

    ERNAsyncItemsRepositoryTableViewManager *tableViewManager =
    [ERNAsyncItemsRepositoryTableViewManager createWithRepository:repository
                                                      itemManager:[self itemManager]];
    id<UITableViewDelegate>delegate =
    [ERNTableViewDelegate createWithTableViewManager:tableViewManager];
    id<UITableViewDataSource>dataSource =
    [ERNTableViewDataSource createWithTableViewManager:tableViewManager];
    ERNTableViewMicroController *tableViewMicroController =
    [ERNTableViewMicroController createWithTableViewDelegate:delegate
                                         tableViewDataSource:dataSource
                                                   superView:[viewController view]];
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    ERNRefreshControlRepositoryRefreshController *refreshDragController =
    [ERNRefreshControlRepositoryRefreshController createWithRefreshControl:refreshControl
                                                                repository:repository];
    ERNTableViewRepositoryRefreshController *refreshActionController =
    [ERNTableViewRepositoryRefreshController createWithTableView:[tableViewMicroController tableView]
                                                      repository:repository];

    [[tableViewMicroController tableView] addSubview:refreshControl];
    [viewController ERN_addMicroController:refreshDragController];
    [viewController ERN_addMicroController:tableViewMicroController];
    [viewController ERN_addMicroController:refreshActionController];
    return viewController;
}

#pragma mark - private - initializers

-(id)initWithItemManager:(id<ERNTableViewItemManager>)itemManager
       repositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
                   title:(NSString *)title
{
    self = [self init];
    ERNCheckNil(self);
    _repositoryFactory = repositoryFactory;
    _itemManager = itemManager;
    _title = title;
    return self;
}

@end
