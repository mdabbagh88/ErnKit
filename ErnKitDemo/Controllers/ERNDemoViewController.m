#import "ERNDemoViewController.h"
#import "ERNAsyncItemsRepository.h"
#import "NSObject+ERNHelper.h"

@interface ERNDemoViewController ()
@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, readonly) id<UITableViewDataSource> tableViewDataSource;
@property (nonatomic, readonly) id<UITableViewDelegate> tableViewDelegate;
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> repository;
@end

@implementation ERNDemoViewController

-(void)viewDidLoad
{
    [[self tableView] setDelegate:[self tableViewDelegate]];
    [[self tableView] setDataSource:[self tableViewDataSource]];
    [[self repository] addObserver:self
                          selector:@selector(repositoryRefreshed)];
    [self refreshRepository];
}

-(void)refreshRepository
{
    [[self repository] refresh];
    [self performSelector:@selector(refreshRepository)
               withObject:self
               afterDelay:3];
}

-(void)repositoryRefreshed
{
    [[self tableView] reloadData];
}

-(void)dealloc
{
    [[self repository] removeObserver:self];
}

-(id)initWithTableViewDelegate:(id<UITableViewDelegate>)tableViewDelegate
           tableViewDataSource:(id<UITableViewDataSource>)tableViewDataSource
                    repository:(id<ERNAsyncItemsRepository>)repository
{
    self = [self init];
    ERNCheckNil(self);
    _tableViewDataSource = tableViewDataSource;
    _tableViewDelegate = tableViewDelegate;
    _repository = repository;
    return self;
}

+(instancetype)viewControllerWithTableViewDelegate:(id<UITableViewDelegate>)tableViewDelegate
                               tableViewDataSource:(id<UITableViewDataSource>)tableViewDataSource
                                        repository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithTableViewDelegate:tableViewDelegate
                               tableViewDataSource:tableViewDataSource
                                        repository:repository];
}

@end
