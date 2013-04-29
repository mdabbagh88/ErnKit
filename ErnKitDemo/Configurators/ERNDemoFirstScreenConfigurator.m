#import "ERNDemoFirstScreenConfigurator.h"
#import "ERNDemoViewController.h"
#import "ERNTableViewDataSource.h"
#import "ERNTableViewDelegate.h"

#import "ERNDemoTableViewManager.h"
#import "ERNRoutingTableViewManager.h"
#import "ERNAsyncItemsRepositoryTableViewManager.h"

#import "ERNDemoStringAsyncItemsRepository.h"
#import "ERNArrayAsyncItemsRepository.h"

#import "ERNRoutingTableViewCellFactory.h"
#import "ERNDemoObjectTableViewCellFactory.h"

#import "ERNDemoObject.h"

#import "ERNRoutingUrlMimeFactory.h"
#import "ERNURLUrlMimeFactory.h"
#import "ERNDemoObjectUrlMimeFactory.h"
#import "ERNNumberUrlMimeFactory.h"

#import "ERNActionHandlerImpl.h"

#import "NSObject+ERNHelper.h"

@interface ERNDemoFirstScreenConfigurator ()
@property (nonatomic, readonly) id<ERNActionHandler>actionHandler;
@property (nonatomic, readonly) id<ERNAsyncItemsRepository>repository;
@end

@implementation ERNDemoFirstScreenConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    NSDictionary *cellMappings = @{NSStringFromClass([ERNDemoObject class]) : [ERNDemoObjectTableViewCellFactory tableViewCellFactory]};
    id<ERNTableViewCellFactory> cellFactory = [ERNRoutingTableViewCellFactory tableViewCellFactoryWithMappings:cellMappings];
    id<ERNAsyncItemsRepository> firstAsyncItemsRepository = [ERNDemoStringAsyncItemsRepository asyncItemsRepository];
    id<ERNTableViewManager> togglingTableViewManager = [ERNAsyncItemsRepositoryTableViewManager tableViewManagerWithRepository:firstAsyncItemsRepository
                                                                                                                cellFactory:cellFactory
                                                                                                              actionHandler:[self actionHandler]];
    id<ERNTableViewManager> lastTableViewManager = [ERNDemoTableViewManager tableViewManagerWithText:@"last"];
    id<ERNTableViewManager> itemTableViewManager = [ERNAsyncItemsRepositoryTableViewManager tableViewManagerWithRepository:[self repository]
                                                                                                                cellFactory:cellFactory
                                                                                                              actionHandler:[self actionHandler]];

    id<ERNTableViewManager> routedTableViewManager = [ERNRoutingTableViewManager tableViewManagerWithFirstTableViewManager:itemTableViewManager
                                                                                                      restTableViewManager:[ERNRoutingTableViewManager tableViewManagerWithFirstTableViewManager:togglingTableViewManager
                                                                                                                                                                            restTableViewManager:lastTableViewManager]];
    id<UITableViewDataSource> tableViewDataSource = [ERNTableViewDataSource tableViewDataSourceWithTableViewManager:routedTableViewManager];
    id<UITableViewDelegate> tableViewDelegate = [ERNTableViewDelegate tableViewDelegateWithTableViewManager:routedTableViewManager];
    return [self setupViewController:[ERNDemoViewController viewControllerWithTableViewDelegate:tableViewDelegate
                                                  tableViewDataSource:tableViewDataSource
                                                                                     repository:firstAsyncItemsRepository]];
}

-(UIViewController *)setupViewController:(ERNDemoViewController *)viewController
{
    [viewController setTitle:@"First Screen"];
    return viewController;
}

-(id)initWithItemActionHandler:(id<ERNActionHandler>)actionHandler
                    repository:(id<ERNAsyncItemsRepository>)repository
{
    self = [self init];
    ERNCheckNil(self);
    _actionHandler = actionHandler;
    _repository = repository;
    return self;
}

+(instancetype)configuratorWithItemActionHandler:(id<ERNActionHandler>)actionHandler
                                      repository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithItemActionHandler:actionHandler
                                        repository:repository];
}

@end
