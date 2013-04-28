#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "ERNRoutingTableViewManager.h"
#import "NSObject+ERNHelper.h"

@interface ERNRoutingTableViewManager ()
@property (nonatomic, readonly) id<ERNTableViewManager> firstTableViewManager;
@property (nonatomic, readonly) id<ERNTableViewManager> restTableViewManager;
@end

@implementation ERNRoutingTableViewManager

-(NSInteger)sections
{
    return [[self firstTableViewManager] sections] + [[self restTableViewManager] sections];
}

-(NSInteger)rowsInSection:(NSInteger)section
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    NSInteger routedSection = [self routedSection:section];
    return [routedTableViewManager rowsInSection:routedSection];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
              cellForIndexPath:(NSIndexPath *)indexPath
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:[indexPath section]];
    NSIndexPath *routedIndexPath = [self routedIndexPathForIndexPath:indexPath];
    return [routedTableViewManager tableView:tableView
                            cellForIndexPath:routedIndexPath];
}


-(void)actionForIndexPath:(NSIndexPath *)indexPath
{
    id routedTableViewManager = [self routedTableViewManagerForSection:[indexPath section]];
    NSIndexPath *routedIndexPath = [self routedIndexPathForIndexPath:indexPath];
    [[routedTableViewManager guaranteeSelectorResponse:@selector(actionForIndexPath:)] actionForIndexPath:routedIndexPath];
}

-(NSString *)titleForFooterInSection:(NSInteger)section
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    return [routedTableViewManager respondsToSelector:@selector(titleForFooterInSection:)] ?
    [routedTableViewManager titleForFooterInSection:[self routedSection:section]] :
    @"";
}

-(NSString *)titleForHeaderInSection:(NSInteger)section
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    return [routedTableViewManager respondsToSelector:@selector(titleForHeaderInSection:)] ?
    [routedTableViewManager titleForHeaderInSection:[self routedSection:section]] :
    @"";
}

-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
                    defaultHeight:(CGFloat)defaultHeight
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:[indexPath section]];
    return [routedTableViewManager respondsToSelector:@selector(heightForRowAtIndexPath:defaultHeight:)] ?
    [routedTableViewManager heightForRowAtIndexPath:[self routedIndexPathForIndexPath:indexPath]
                                      defaultHeight:defaultHeight] :
    defaultHeight;
}

-(CGFloat)heightForHeaderInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    return [routedTableViewManager respondsToSelector:@selector(heightForHeaderInSection:defaultHeight:)] ?
    [routedTableViewManager heightForHeaderInSection:[self routedSection:section]
                                       defaultHeight:defaultHeight] :
    defaultHeight;
}

-(CGFloat)heightForFooterInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    return [routedTableViewManager respondsToSelector:@selector(heightForFooterInSection:defaultHeight:)] ?
    [routedTableViewManager heightForFooterInSection:[self routedSection:section]
                                       defaultHeight:defaultHeight] :
    defaultHeight;
}

-(UIView *)viewForHeaderInSection:(NSInteger)section
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    return [routedTableViewManager respondsToSelector:@selector(viewForHeaderInSection:)] ?
    [routedTableViewManager viewForHeaderInSection:[self routedSection:section]] :
    nil;
}

-(UIView *)viewForFooterInSection:(NSInteger)section
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    return [routedTableViewManager respondsToSelector:@selector(viewForFooterInSection:)] ?
    [routedTableViewManager viewForFooterInSection:[self routedSection:section]] :
    nil;
}

-(id<ERNTableViewManager>)routedTableViewManagerForSection:(NSInteger)section
{
    return section == 0 ? [self firstTableViewManager] : [self restTableViewManager];
}

-(NSIndexPath *)routedIndexPathForIndexPath:(NSIndexPath *)indexPath
{
    return [indexPath section] == 0 ? indexPath : [self restIndexPathForIndexPath:indexPath];
}

-(NSInteger)routedSection:(NSInteger)section
{
    return section == 0 ? section : [self restSectionForSection:section];
}

-(NSIndexPath*)restIndexPathForIndexPath:(NSIndexPath *)indexPath
{
    return [NSIndexPath indexPathForRow:[indexPath row]
                              inSection:[indexPath section] - 1];
}

-(NSInteger)restSectionForSection:(NSInteger)section
{
    return section - 1;
}

-(id)initWithFirstTableViewManager:(id<ERNTableViewManager>)firstTableViewManager
              restTableViewManager:(id<ERNTableViewManager>)restTableViewManager
{
    self = [self init];
    ERNCheckNil(self);
    _firstTableViewManager = firstTableViewManager;
    _restTableViewManager = restTableViewManager;
    return self;
}

+(instancetype)tableViewManagerWithFirstTableViewManager:(id<ERNTableViewManager>)firstTableViewManager
                                    restTableViewManager:(id<ERNTableViewManager>)restTableViewManager
{
    return [[self alloc] initWithFirstTableViewManager:firstTableViewManager
                                  restTableViewManager:restTableViewManager];
}

@end
