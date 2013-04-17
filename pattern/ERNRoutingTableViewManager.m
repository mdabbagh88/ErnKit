#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "ERNRoutingTableViewManager.h"

@interface ERNRoutingTableViewManager ()
@property (nonatomic, readonly) id<ERNTableViewManager> firstTableViewManager;
@property (nonatomic, readonly) id<ERNTableViewManager> restTableViewManager;
@end

@implementation ERNRoutingTableViewManager

- (NSInteger)sections
{
    return [[self firstTableViewManager] sections] + [[self restTableViewManager] sections];
}

-(NSInteger)rowsInSection:(NSInteger)section
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    NSInteger routedSection = [self routedSection:section];
    return [routedTableViewManager rowsInSection:routedSection];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
              cellForIndexPath:(NSIndexPath *)indexPath
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:indexPath.section];
    NSIndexPath *routedIndexPath = [self routedIndexPathForIndexPath:indexPath];
    return [routedTableViewManager tableView:tableView
                            cellForIndexPath:routedIndexPath];
}


-(void)actionForIndexPath:(NSIndexPath *)indexPath
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:indexPath.section];
    NSIndexPath *routedIndexPath = [self routedIndexPathForIndexPath:indexPath];
    if ([routedTableViewManager respondsToSelector:@selector(actionForIndexPath:)]) {
        [routedTableViewManager actionForIndexPath:routedIndexPath];
    }
}

-(NSString *)titleForFooterInSection:(NSInteger)section
{
    NSString *titleForFooter = @"";
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    if ([routedTableViewManager respondsToSelector:@selector(titleForFooterInSection:)]) {
        titleForFooter = [routedTableViewManager titleForFooterInSection:[self routedSection:section]];
    }
    return titleForFooter;
}

-(NSString *)titleForHeaderInSection:(NSInteger)section
{
    NSString *titleForHeader = @"";
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    if ([routedTableViewManager respondsToSelector:@selector(titleForHeaderInSection:)]) {
        titleForHeader = [routedTableViewManager titleForHeaderInSection:[self routedSection:section]];
    }
    return titleForHeader;
}

-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath defaultHeight:(CGFloat)defaultHeight
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:indexPath.section];
    CGFloat height = defaultHeight;
    if ([routedTableViewManager respondsToSelector:@selector(heightForRowAtIndexPath:)]) {
        height = [routedTableViewManager heightForRowAtIndexPath:[self routedIndexPathForIndexPath:indexPath]
                                                   defaultHeight:defaultHeight];
    }
    return height;
}

-(CGFloat)heightForHeaderInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    CGFloat height = defaultHeight;
    if ([routedTableViewManager respondsToSelector:@selector(heightForHeaderInSection:)]) {
        height = [routedTableViewManager heightForHeaderInSection:[self routedSection:section]
                                                    defaultHeight:defaultHeight];
    }
    return height;
}

-(CGFloat)heightForFooterInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight
{
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    CGFloat height = defaultHeight;
    if ([routedTableViewManager respondsToSelector:@selector(heightForFooterInSection:defaultHeight:)]) {
        height = [routedTableViewManager heightForFooterInSection:[self routedSection:section]
                                                    defaultHeight:defaultHeight];
    }
    return height;
}

-(UIView *)viewForHeaderInSection:(NSInteger)section
{
    UIView *view = nil;
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    if ([routedTableViewManager respondsToSelector:@selector(viewForHeaderInSection:)]) {
        view = [routedTableViewManager viewForHeaderInSection:[self routedSection:section]];
    }
    return view;

}

-(UIView *)viewForFooterInSection:(NSInteger)section
{
    UIView *view = nil;
    id<ERNTableViewManager> routedTableViewManager = [self routedTableViewManagerForSection:section];
    if ([routedTableViewManager respondsToSelector:@selector(viewForFooterInSection:)]) {
        view = [routedTableViewManager viewForFooterInSection:[self routedSection:section]];
    }
    return view;
}

-(id<ERNTableViewManager>)routedTableViewManagerForSection:(NSInteger)section
{
    return section == 0 ? [self firstTableViewManager] : [self restTableViewManager];
}

-(NSIndexPath *)routedIndexPathForIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0 ? indexPath : [self restIndexPathForIndexPath:indexPath];
}

-(NSInteger)routedSection:(NSInteger)section
{
    return section == 0 ? section : [self restSectionForSection:section];
}

-(NSIndexPath*)restIndexPathForIndexPath:(NSIndexPath *)indexPath
{
    return [NSIndexPath indexPathForRow:indexPath.row
                              inSection:indexPath.section - 1];
}

-(NSInteger)restSectionForSection:(NSInteger)section
{
    return section - 1;
}

-(id)initWithFirstTableViewManager:(id<ERNTableViewManager>)firstTableViewManager
              restTableViewManager:(id<ERNTableViewManager>)restTableViewManager
{
    self = [super init];
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
