#import "ERNDemoFirstScreenConfigurator.h"
#import "ERNDemoViewController.h"
#import "ERNTableViewDataSource.h"
#import "ERNTableViewDelegate.h"
#import "ERNDemoTableViewManager.h"
#import "ERNRoutingTableViewManager.h"
#import "ERNAsyncItemsRepositoryTableViewManager.h"
#import "ERNRoutingTableViewCellFactory.h"
#import "ERNDemoStringAsyncItemsRepository.h"
#import "ERNDemoDemoObjectTableViewCellFactory.h"
#import "ERNDemoObjectAsyncItemsRepository.h"
#import "ERNAction.h"
#import "ERNDemoObject.h"
#import "ERNUrlMimeFactory.h"

@interface ERNDemoFirstScreenConfigurator ()
@property (nonatomic, readonly) id<ERNAction>action;
@property (nonatomic, readonly) id<ERNUrlMimeFactory>urlMimeFactory;
@end

@implementation ERNDemoFirstScreenConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    NSDictionary *cellMappings = @{NSStringFromClass([ERNDemoObject class]) : [ERNDemoDemoObjectTableViewCellFactory tableViewCellFactory]};
    id<ERNTableViewCellFactory> cellFactory = [ERNRoutingTableViewCellFactory tableViewCellFactoryWithMappings:cellMappings];
    id<ERNAsyncItemsRepository> firstAsyncItemsRepository = [ERNDemoStringAsyncItemsRepository asyncItemsRepository];
    id<ERNAsyncItemsRepository> thirdAsyncItemsRepository = [ERNDemoObjectAsyncItemsRepository asyncItemsRepository];
    id<ERNTableViewManager> firstTableViewManager = [ERNAsyncItemsRepositoryTableViewManager tableViewManagerWithRepository:firstAsyncItemsRepository
                                                                                                                cellFactory:cellFactory
                                                                                                                     action:[self action]
                                                                                                             urlMimeFactory:[self urlMimeFactory]];
    id<ERNTableViewManager> secondTableViewManager = [ERNDemoTableViewManager tableViewManagerWithText:@"second"];
    id<ERNTableViewManager> thirdTableViewManager = [ERNAsyncItemsRepositoryTableViewManager tableViewManagerWithRepository:thirdAsyncItemsRepository
                                                                                                                cellFactory:cellFactory
                                                                                                                     action:[self action]
                                                                                                             urlMimeFactory:[self urlMimeFactory]];

    id<ERNTableViewManager> routedTableViewManager = [ERNRoutingTableViewManager tableViewManagerWithFirstTableViewManager:firstTableViewManager
                                                                                                      restTableViewManager:[ERNRoutingTableViewManager tableViewManagerWithFirstTableViewManager:secondTableViewManager restTableViewManager:thirdTableViewManager]];
    id<UITableViewDataSource> tableViewDataSource = [ERNTableViewDataSource tableViewDataSourceWithTableViewManager:routedTableViewManager];
    id<UITableViewDelegate> tableViewDelegate = [ERNTableViewDelegate tableViewDelegateWithTableViewManager:routedTableViewManager];
    return [ERNDemoViewController viewControllerWithTableViewDelegate:tableViewDelegate
                                                  tableViewDataSource:tableViewDataSource];
}

- (id)initWithItemAction:(id<ERNAction>)action
          urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory
{
    self = [super init];
    _action = action;
    _urlMimeFactory = urlMimeFactory;
    return self;
}

+ (instancetype)configuratorWithItemAction:(id<ERNAction>)action
                            urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory
{
    return [[self alloc] initWithItemAction:action
                             urlMimeFactory:urlMimeFactory];
}
@end
