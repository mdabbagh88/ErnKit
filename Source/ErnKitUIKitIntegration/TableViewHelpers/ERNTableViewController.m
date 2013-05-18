#import "ERNTableViewController.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNTableViewCellFactory.h"
#import "ERNAsyncItemsRepositoryTableViewManager.h"
#import "ERNTableViewDataSource.h"
#import "ERNTableViewDelegate.h"
#import "ERNErrorHandler.h"
#import "ERNTableViewItemManager.h"
#import "ERNDefaultTableViewItemManager.h"
#import "ERNTableViewRepositoryRefreshController.h"

@interface ERNTableViewController ()
@property (nonatomic, readwrite) ERNTableViewRepositoryRefreshController *refreshController;
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> repository;
@property (nonatomic, readonly) id<ERNTableViewManager> tableViewManager;
@property (nonatomic, readonly) id<UITableViewDataSource> dataSource;
@property (nonatomic, readonly) id<UITableViewDelegate> delegate;
@end

@implementation ERNTableViewController {
    id<ERNTableViewManager> _tableViewManager;
    id<UITableViewDelegate> _delegate;
    id<UITableViewDataSource> _dataSource;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        itemManager:(id<ERNTableViewItemManager>)itemManager;
{
    return [[self alloc] initWithRepository:repository
                           tableViewManager:
            [ERNAsyncItemsRepositoryTableViewManager createWithRepository:repository
                                                              itemManager:itemManager]];
}

#pragma mark - UIViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTableView:[self tableView]];
}

#pragma mark - private

-(void)setupTableView:(UITableView *)tableView
{
    [tableView setDelegate:[self delegate]];
    [tableView setDataSource:[self dataSource]];
    [self setRefreshController:[ERNTableViewRepositoryRefreshController
                                createWithTableView:tableView
                                repository:[self repository]]];
}

#pragma mark - private - accessors

-(void)setTableView:(UITableView *)tableView
{
    [super setTableView:tableView];
    [self setupTableView:tableView];
}

-(id<UITableViewDataSource>)dataSource
{
    return _dataSource = _dataSource ?
    _dataSource :
    [ERNTableViewDataSource createWithTableViewManager:[self tableViewManager]];
}

-(id<UITableViewDelegate>)delegate
{
    return _delegate = _delegate ?
    _delegate :
    [ERNTableViewDelegate createWithTableViewManager:[self tableViewManager]];
}

#pragma mark - private - initializers

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
       tableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    _tableViewManager = tableViewManager;
    return self;
}

@end
