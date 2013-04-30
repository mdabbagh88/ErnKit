#import "ERNTableViewDataSource.h"
#import "ERNTableViewManager.h"
#import "NSObject+ERNHelper.h"
#import "UITableViewCell+ERNHelper.h"
#import "ERNDummyTableViewCell.h"

@interface ERNTableViewDataSource ()
@property (nonatomic, readonly) id<ERNTableViewManager> tableViewManager;
@end

@implementation ERNTableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilAndReturn(tableView, [ERNDummyTableViewCell dummyCell]);
    ERNCheckNilAndReturn(indexPath, [ERNDummyTableViewCell dummyCell]);
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
    return [self canHandleTitleForFooterInSection] ?
    [[self tableViewManager] titleForFooterInSection:section] :
    @"";
}

-(BOOL)canHandleTitleForFooterInSection
{
    return [[self tableViewManager] respondsToSelector:@selector(titleForFooterInSection:)];
}

-(NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return [self canHandleTitleForHeaderInSection] ?
    [[self tableViewManager] titleForHeaderInSection:section] :
    @"";
}

-(BOOL)canHandleTitleForHeaderInSection
{
    return [[self tableViewManager] respondsToSelector:@selector(titleForHeaderInSection:)];
}

-(id)initWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    self = [self init];
    ERNCheckNil(self);
    _tableViewManager = tableViewManager;
    return self;
}

+(instancetype)tableViewDataSourceWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    return [[self alloc] initWithTableViewManager:tableViewManager];
}

@end
