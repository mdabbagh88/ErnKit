#import "ERNNullTableViewManager.h"
#import "ERNDummyTableViewCell.h"

static ERNNullTableViewManager *immutableSingleton;

@implementation ERNNullTableViewManager {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
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
    immutableSingleton = [self new];
}

@end
