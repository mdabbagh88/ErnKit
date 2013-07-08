#import "ERNTableViewController.h"
#import "ERNTableViewDataSource.h"
#import "ERNTableViewDelegate.h"
#import "ERNErrorHandler.h"
#import "ERNTableViewItemManager.h"

@interface ERNTableViewController ()
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

+(instancetype)createWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    return [[self alloc] initWithTableViewManager:tableViewManager];
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

-(id)initWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    self = [super init];
    ERNCheckNil(self);
    _tableViewManager = tableViewManager;
    return self;
}

@end
