#import "ERNTogglingTableViewManager.h"
#import "ERNErrorHandler.h"
#import "NSObject+ERNHelper.h"
#import "ERNNullTableViewManager.h"
#import "ERNNullTableViewCell.h"

@interface ERNTogglingTableViewManager ()
@property (nonatomic, readonly, copy) NSArray *tableViewManagers;
@property (nonatomic, readonly, weak) UITableView *tableView;
@property (nonatomic) id<ERNTableViewManager> currentTableViewManager;
@end

@implementation ERNTogglingTableViewManager {
    NSUInteger _selectedIndex;
    NSArray *_tableViewManagers;
}

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

-(UITableViewCell *)cellForIndexPath:(NSIndexPath *)indexPath
                          cellReuser:(UITableViewCell *(^)(NSString *identifier))block
{
    ERNCheckNilAndReturn(indexPath, [ERNNullTableViewCell create]);
    return [[self currentTableViewManager] cellForIndexPath:indexPath
                                                 cellReuser:block];
}

-(void)actionForIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilNoReturn(indexPath);
    [[(id)[self currentTableViewManager]
      ERN_guaranteeSelectorResponse:@selector(actionForIndexPath:)] actionForIndexPath:indexPath];
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

-(void)setSelectedIndex:(NSUInteger)index
{
    _selectedIndex = index;
    [self changeCurrentTableViewManagerToIndex:index];
    reloadTableView([self tableView]);
    [self notifyObservers];
}

-(NSUInteger)selectedIndex
{
    return _selectedIndex;
}

#pragma mark - private

static void reloadTableView(UITableView *tableView)
{
    [tableView reloadData];
}

-(void)changeCurrentTableViewManagerToIndex:(NSUInteger)index
{
    _currentTableViewManager = validTableViewManager([self tableViewManagerAtIndex:index]);
}

static id<ERNTableViewManager> validTableViewManager(id<ERNTableViewManager> tableViewManager)
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
    self = [super init];
    ERNCheckNil(self);
    _tableViewManagers = tableViewManagers;
    _tableView = tableView;
    _selectedIndex = 0;
    return self;
}

@end
