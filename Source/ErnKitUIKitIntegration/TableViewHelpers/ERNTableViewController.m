#import "ERNTableViewController.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNTableViewCellFactory.h"
#import "ERNUrlMimeFactory.h"
#import "ERNAsyncItemsRepositoryTableViewManager.h"
#import "ERNTableViewDataSource.h"
#import "ERNTableViewDelegate.h"
#import "ERNErrorHandler.h"

@interface ERNTableViewController ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> repository;
@property (nonatomic, readonly) id<ERNTableViewManager> tableViewManager;
@property (nonatomic, readonly) id<UITableViewDataSource> dataSource;
@property (nonatomic, readonly) id<UITableViewDelegate> delegate;
@property (nonatomic, readonly, copy) id<ERNTableViewManager> (^createTableViewManager)();
@property (nonatomic, readonly, copy) UIRefreshControl *(^createRefresh)();
@end

@implementation ERNTableViewController {
    id<ERNTableViewManager> _tableViewManager;
    id<UITableViewDelegate> _delegate;
    id<UITableViewDataSource> _dataSource;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithRepository:repository];
}

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        cellFactory:(id<ERNTableViewCellFactory>)cellFactory
{
    return [[self alloc] initWithRepository:repository
                                cellFactory:cellFactory];
}

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                      actionHandler:(id<ERNActionHandler>)actionHandler
{
    return [[self alloc] initWithRepository:repository
                              actionHandler:actionHandler];
}

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                      actionHandler:(id<ERNActionHandler>)actionHandler
{
    return [[self alloc] initWithRepository:repository
                                cellFactory:cellFactory
                              actionHandler:actionHandler];
}

+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initRefreshableWithRepository:repository];
}

+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   cellFactory:(id<ERNTableViewCellFactory>)cellFactory
{
    return [[self alloc] initRefreshableWithRepository:repository
                                           cellFactory:cellFactory];
}

+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                 actionHandler:(id<ERNActionHandler>)actionHandler
{
    return [[self alloc] initRefreshableWithRepository:repository
                                         actionHandler:actionHandler];
}


+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                                 actionHandler:(id<ERNActionHandler>)actionHandler
{
    return [[self alloc] initRefreshableWithRepository:repository
                                           cellFactory:cellFactory
                                         actionHandler:actionHandler];
}

#pragma mark - UIViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[self tableView] setDataSource:[self dataSource]];
    [[self tableView] setDelegate:[self delegate]];
    [self setRefreshControl:[self createRefresh]()];
    [[self refreshControl] addTarget:self
                              action:@selector(refreshRepository)
                    forControlEvents:UIControlEventValueChanged];
    [[self repository] addObserver:self
                          selector:@selector(repositoryRefreshed)];
}

#pragma mark - NSObject

-(void)dealloc
{
    [_repository removeObserver:self];
}

#pragma mark - private

-(void)refreshRepository
{
    [[self repository] refresh];
}

-(void)repositoryRefreshed
{
    [[self refreshControl] endRefreshing];
    [[self tableView] reloadData];
}

-(void)setupRefreshable
{
    _createRefresh = ^() {
        return [UIRefreshControl new];
    };
}

#pragma mark - private - accessors

-(void)setTableView:(UITableView *)tableView
{
    [super setTableView:tableView];
    [tableView setDelegate:[self delegate]];
    [tableView setDataSource:[self dataSource]];
}

-(id<ERNTableViewManager>)tableViewManager
{
    return _tableViewManager = _tableViewManager ?
    _tableViewManager :
    [self createTableViewManager]();
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
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    _createTableViewManager = ^(){
        return [ERNAsyncItemsRepositoryTableViewManager createWithRepository:repository];
    };
    _createRefresh = ^(){
        return (UIRefreshControl *)nil;
    };
    return self;
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
            cellFactory:(id<ERNTableViewCellFactory>)cellFactory
{
    self = [self initWithRepository:repository];
    ERNCheckNil(self);
    _createTableViewManager = ^(){
        return [ERNAsyncItemsRepositoryTableViewManager createWithRepository:repository
                                                                 cellFactory:cellFactory];
    };
    return self;
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
          actionHandler:(id<ERNActionHandler>)actionHandler
{
    self = [self initWithRepository:repository];
    ERNCheckNil(self);
    _createTableViewManager = ^(){
        return [ERNAsyncItemsRepositoryTableViewManager createWithRepository:repository
                                                               actionHandler:actionHandler];
    };
    return self;
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
            cellFactory:(id<ERNTableViewCellFactory>)cellFactory
          actionHandler:(id<ERNActionHandler>)actionHandler
{
    self = [self initWithRepository:repository
                        cellFactory:cellFactory];
    ERNCheckNil(self);
    _createTableViewManager = ^(){
        return [ERNAsyncItemsRepositoryTableViewManager createWithRepository:repository
                                                                 cellFactory:cellFactory
                                                               actionHandler:actionHandler];
    };
    return self;
}

-(id)initRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    self = [self initWithRepository:repository];
    ERNCheckNil(self);
    [self setupRefreshable];
    return self;
}

-(id)initRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                       cellFactory:(id<ERNTableViewCellFactory>)cellFactory
{
    self = [self initWithRepository:repository
                        cellFactory:cellFactory];
    ERNCheckNil(self);
    [self setupRefreshable];
    return self;
}

-(id)initRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                       cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                     actionHandler:(id<ERNActionHandler>)actionHandler
{
    self = [self initWithRepository:repository
                        cellFactory:cellFactory
                      actionHandler:actionHandler];
    ERNCheckNil(self);
    [self setupRefreshable];
    return self;
}

-(id)initRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                     actionHandler:(id<ERNActionHandler>)actionHandler
{
    self = [self initWithRepository:repository
                      actionHandler:actionHandler];
    ERNCheckNil(self);
    [self setupRefreshable];
    return self;
}


@end
