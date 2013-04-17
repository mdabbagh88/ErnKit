#import "ERNDemoViewController.h"

@interface ERNDemoViewController ()
@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, readonly) id<UITableViewDataSource> tableViewDataSource;
@property (nonatomic, readonly) id<UITableViewDelegate> tableViewDelegate;
@end

@implementation ERNDemoViewController

-(void)viewDidLoad
{
    [[self tableView] setDelegate:[self tableViewDelegate]];
    [[self tableView] setDataSource:[self tableViewDataSource]];
}

-(id)initWithTableViewDelegate:(id<UITableViewDelegate>)tableViewDelegate
           tableViewDataSource:(id<UITableViewDataSource>)tableViewDataSource
{
    self = [super initWithNibName:nil
                           bundle:nil];
    _tableViewDataSource = tableViewDataSource;
    _tableViewDelegate = tableViewDelegate;
    return self;
}

+(instancetype)viewControllerWithTableViewDelegate:(id<UITableViewDelegate>)tableViewDelegate
                               tableViewDataSource:(id<UITableViewDataSource>)tableViewDataSource
{
    return [[self alloc] initWithTableViewDelegate:tableViewDelegate
                               tableViewDataSource:tableViewDataSource];
}

@end
