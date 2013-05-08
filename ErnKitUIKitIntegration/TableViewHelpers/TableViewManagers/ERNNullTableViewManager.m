#import "ERNNullTableViewManager.h"
#import "ERNDummyTableViewCell.h"

static ERNNullTableViewManager *tableViewManager;

@implementation ERNNullTableViewManager {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return tableViewManager;
}

#pragma mark - ERNTableViewManager

-(UITableViewCell *)tableView:(UITableView *)tableView
             cellForIndexPath:(NSIndexPath *)indexPath
{
    return [ERNDummyTableViewCell create];
}

-(NSInteger)sections
{
    return 0;
}

-(NSInteger)rowsInSection:(NSInteger)section
{
    return 0;
}

#pragma mark - NSObject

+(void)initialize
{
    tableViewManager = [self new];
}

@end
