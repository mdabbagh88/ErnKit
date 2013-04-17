#import "ERNDemoSecondScreenConfigurator.h"
#import "ERNDemoViewController.h"
#import "ERNTableViewDataSource.h"
#import "ERNTableViewDelegate.h"
#import "ERNDemoTableViewManager.h"
#import "ERNRoutingTableViewManager.h"
#import "ERNAsyncItemsRepositoryTableViewManager.h"
#import "ERNRoutingTableViewCellFactory.h"
#import "ERNDemoStringAsyncItemsRepository.h"

@implementation ERNDemoSecondScreenConfigurator
-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    NSArray *items = @[@"second screen item",
                       @"...and another one"];
    id<ERNTableViewCellFactory> cellFactory = [ERNRoutingTableViewCellFactory tableViewCellFactory];
    id<ERNAsyncItemsRepository> asyncItemsRepository = [ERNDemoStringAsyncItemsRepository asyncItemsRepositoryWithItems:items];
    id<ERNTableViewManager> tableViewManager = [ERNAsyncItemsRepositoryTableViewManager tableViewManagerWithRepository:asyncItemsRepository
                                                                                                                cellFactory:cellFactory];
    id<UITableViewDataSource> tableViewDataSource = [ERNTableViewDataSource tableViewDataSourceWithTableViewManager:tableViewManager];
    id<UITableViewDelegate> tableViewDelegate = [ERNTableViewDelegate tableViewDelegateWithTableViewManager:tableViewManager];
    return [ERNDemoViewController viewControllerWithTableViewDelegate:tableViewDelegate
                                                  tableViewDataSource:tableViewDataSource];
}

+ (instancetype)configurator
{
    return [[self alloc] init];
}

@end
