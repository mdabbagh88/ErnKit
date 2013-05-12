#import "ERNTogglingTableViewManager.h"
#import "ERNErrorHandler.h"
#import "NSObject+ERNHelper.h"
#import "ERNNullTableViewManager.h"
#import "ERNDummyTableViewCell.h"

@interface ERNTogglingTableViewManager ()
@property (nonatomic, readonly, copy) NSArray *tableViewManagers;
@property (nonatomic, readonly, weak) UITableView *tableView;
@property (nonatomic) id<ERNTableViewManager> currentTableViewManager;
@end

@implementation ERNTogglingTableViewManager

#pragma mark - public - constructors

+(instancetype)createWithTableViewManagers:(NSArray *)tableViewManagers
                                 tableView:(UITableView *)tableView
{
    return [[self alloc] initWithTableViewManagers:tableViewManagers
                                         tableView:tableView];
}

#pragma mark - ERNTableViewManager

-(NSInteger)sections
{
    return [[self currentTableViewManager] sections];
}

-(NSInteger)rowsInSection:(NSInteger)section
{
    return [[self currentTableViewManager] rowsInSection:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
             cellForIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilAndReturn(tableView, [ERNDummyTableViewCell create]);
    ERNCheckNilAndReturn(indexPath, [ERNDummyTableViewCell create]);
    return [[self currentTableViewManager] tableView:tableView
                                    cellForIndexPath:indexPath];
}

-(void)actionForIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilNoReturn(indexPath);
    [[(id)[self currentTableViewManager]
      guaranteeSelectorResponse:@selector(actionForIndexPath:)] actionForIndexPath:indexPath];
}

-(NSString *)titleForFooterInSection:(NSInteger)section
{
    return [[self currentTableViewManager] respondsToSelector:@selector(titleForFooterInSection:)] ?
    [[self currentTableViewManager] titleForFooterInSection:section] :
    @"";

}

-(NSString *)titleForHeaderInSection:(NSInteger)section
{
    return [[self currentTableViewManager] respondsToSelector:@selector(titleForHeaderInSection:)] ?
    [[self currentTableViewManager] titleForHeaderInSection:section] :
    @"";
}

-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
                    defaultHeight:(CGFloat)defaultHeight
{
    ERNCheckNilAndReturn(indexPath, defaultHeight);
    return [[self currentTableViewManager]
            respondsToSelector:@selector(heightForRowAtIndexPath:defaultHeight:)] ?
    [[self currentTableViewManager] heightForRowAtIndexPath:indexPath
                                      defaultHeight:defaultHeight] :
    defaultHeight;

}

-(CGFloat)heightForHeaderInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight
{
    return [[self currentTableViewManager]
            respondsToSelector:@selector(heightForHeaderInSection:defaultHeight:)] ?
    [[self currentTableViewManager] heightForHeaderInSection:section
                                       defaultHeight:defaultHeight] :
    defaultHeight;

}

-(CGFloat)heightForFooterInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight
{
    return [[self currentTableViewManager]
            respondsToSelector:@selector(heightForFooterInSection:defaultHeight:)] ?
    [[self currentTableViewManager] heightForFooterInSection:section
                                       defaultHeight:defaultHeight] :
    defaultHeight;

}

-(UIView *)viewForHeaderInSection:(NSInteger)section
{
    return [[self currentTableViewManager] respondsToSelector:@selector(viewForHeaderInSection:)] ?
    [[self currentTableViewManager] viewForHeaderInSection:section] :
    nil;
}


-(UIView *)viewForFooterInSection:(NSInteger)section
{
    return [[self currentTableViewManager] respondsToSelector:@selector(viewForFooterInSection:)] ?
    [[self currentTableViewManager] viewForFooterInSection:section] :
    nil;
}

#pragma mark - ERNToggler

-(void)toggleToIndex:(NSUInteger)index
{
    [self changeCurrentTableViewManagerToIndex:index];
    [self reloadTableView:[self tableView]];
}

#pragma mark - private

-(void)reloadTableView:(UITableView *)tableView
{
    [tableView reloadData];
}

-(void)changeCurrentTableViewManagerToIndex:(NSUInteger)index
{
    _currentTableViewManager = [self validTableViewManager:[self tableViewManagerAtIndex:index]];
}

-(id<ERNTableViewManager>)validTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    return tableViewManager && [tableViewManager
                                conformsToProtocol:@protocol(ERNTableViewManager)] ?
    tableViewManager : [ERNNullTableViewManager create];
}

-(id<ERNTableViewManager>)tableViewManagerAtIndex:(NSUInteger)index
{
    return [self tableViewManagers][index];
}

#pragma mark - private - initializers

-(id)initWithTableViewManagers:(NSArray *)tableViewManagers
                     tableView:(UITableView *)tableView
{
    self = [self init];
    ERNCheckNil(self);
    _tableViewManagers = tableViewManagers;
    _tableView = tableView;
    return self;
}

@end
