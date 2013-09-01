#import "ERNDemoTableViewControllerFactory.h"

@interface ERNDemoTableViewControllerFactory ()
@property (nonatomic, readonly) id<ERNAsyncPaginatedItemsRepository> repository;
@property (nonatomic, readonly) id<ERNToggler> toggler;
@end

@implementation ERNDemoTableViewControllerFactory {
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                            toggler:(id<ERNToggler>)toggler
{
    return [[self alloc] initWithRepository:repository
                                    toggler:toggler];
}

#pragma mark - ERNViewControllerFactory

-(UIViewController *)createViewControllerForResource:(ERNResource *)resource
                                           dismisser:(id<ERNViewControllerDismisser>)dismisser
{
    UIViewController *viewController = [UIViewController new];

    UISegmentedControl *feedSegmentedControl =
    [[UISegmentedControl alloc] initWithItems:@[@"Both", @"Demo", @"Demo Two"]];
    [feedSegmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [feedSegmentedControl setSelectedSegmentIndex:0];

    ERNSegmentedControlTogglerController *feedController =
    [ERNSegmentedControlTogglerController createWithSegmentedControl:feedSegmentedControl
                                                             toggler:[self toggler]];

    ERNDefaultTableViewItemManager *itemManager =
    [ERNDefaultTableViewItemManager createWithCellFactory:[ERNDefaultTableViewCellFactory create]
                                            objectAction:[ERNNullObjectAction create]];
    ERNAsyncItemsRepositoryTableViewManager *tableViewManager =
    [ERNAsyncItemsRepositoryTableViewManager createWithRepository:[self repository]
                                                      itemManager:itemManager];
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
                                                                repository:[self repository]];
    [[tableViewMicroController tableView] addSubview:refreshControl];

    ERNTableViewRepositoryRefreshController *refreshActionController =
    [ERNTableViewRepositoryRefreshController createWithTableView:[tableViewMicroController tableView]
                                                      repository:[self repository]];

    [[viewController navigationItem] setTitleView:feedSegmentedControl];
    [viewController ERN_addMicroController:feedController];
    [viewController ERN_addMicroController:refreshDragController];
    [viewController ERN_addMicroController:tableViewMicroController];
    [viewController ERN_addMicroController:refreshActionController];
    
    return viewController;
}

#pragma mark - private - initializer

-(id)initWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                toggler:(id<ERNToggler>)toggler
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    _toggler = toggler;
    return self;
}

@end
