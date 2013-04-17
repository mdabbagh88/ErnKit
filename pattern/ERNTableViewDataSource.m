#import "ERNTableViewDataSource.h"
#import "ERNTableViewManager.h"

@interface ERNTableViewDataSource ()
@property (nonatomic, readonly) id<ERNTableViewManager> tableViewManager;
@end

@implementation ERNTableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self tableViewManager] tableView:tableView
                             cellForIndexPath:indexPath];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self tableViewManager] sections];
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return [[self tableViewManager] rowsInSection:section];
}

-(NSString *)tableView:(UITableView *)tableView
titleForFooterInSection:(NSInteger)section
{
    NSString *titleForFooter = @"";
    if ([[self tableViewManager] respondsToSelector:@selector(titleForFooterInSection:)]) {
        titleForFooter = [[self tableViewManager] titleForFooterInSection:section];
    }
    return titleForFooter;
}

-(NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    NSString *titleForHeader = @"";
    if ([[self tableViewManager] respondsToSelector:@selector(titleForHeaderInSection:)]) {
        titleForHeader = [[self tableViewManager] titleForHeaderInSection:section];
    }
    return titleForHeader;
}

-(id)initWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    self = [super init];
    _tableViewManager = tableViewManager;
    return self;
}

+(instancetype)tableViewDataSourceWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    return [[self alloc] initWithTableViewManager:tableViewManager];
}

@end
