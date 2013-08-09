#import "ERNRefreshableListConfigurator.h"

@interface ERNRefreshableListConfigurator ()
@property (nonatomic, readonly) id<ERNRepositoryFactory> repositoryFactory;
@property (nonatomic, readonly) id<ERNTableViewItemManager> itemManager;
@property (nonatomic, readonly) NSString *title;
@end

@implementation ERNRefreshableListConfigurator {
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

#pragma mark - ERNViewControllerConfigurator

-(UIViewController *)createViewControllerForResource:(ERNResource *)resource
                                           dismisser:(id<ERNViewControllerDismisser>) __unused dismisser
{
    id<ERNAsyncPaginatedItemsRepository> repository =
    [[self repositoryFactory] repositoryForResource:resource];
    [repository refresh];

    UIViewController *viewController = [UIViewController new];

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
    ERNRefreshControlRepositoryRefreshController *controller =
    [ERNRefreshControlRepositoryRefreshController createWithRefreshControl:refreshControl
                                                                repository:repository];
    [[tableViewMicroController tableView] addSubview:refreshControl];
    [viewController ERN_addMicroController:controller];
    [viewController ERN_addMicroController:tableViewMicroController];
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
