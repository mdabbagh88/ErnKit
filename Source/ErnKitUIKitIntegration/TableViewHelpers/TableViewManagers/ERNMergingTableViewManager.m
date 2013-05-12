#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "ERNMergingTableViewManager.h"
#import "ERNErrorHandler.h"
#import "NSObject+ERNHelper.h"
#import "ERNDummyTableViewCell.h"

@interface ERNMergingTableViewManager ()
@property (nonatomic, readonly) id<ERNTableViewManager> firstTableViewManager;
@property (nonatomic, readonly) id<ERNTableViewManager> restTableViewManager;
@end

@implementation ERNMergingTableViewManager {
}

#pragma mark - public - constructors

+(instancetype)createWithFirstTableViewManager:(id<ERNTableViewManager>)firstTableViewManager
                          restTableViewManager:(id<ERNTableViewManager>)restTableViewManager
{
    return [[self alloc] initWithFirstTableViewManager:firstTableViewManager
                                  restTableViewManager:restTableViewManager];
}

#pragma mark - ERNTableViewManager

-(NSInteger)sections
{
    return [[self firstTableViewManager] sections] + [[self restTableViewManager] sections];
}

-(NSInteger)rowsInSection:(NSInteger)section
{
    return [[self routedTableViewManagerForSection:section]
            rowsInSection:[self routedSection:section]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
              cellForIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilAndReturn(tableView, [ERNDummyTableViewCell create]);
    ERNCheckNilAndReturn(indexPath, [ERNDummyTableViewCell create]);
    return [[self routedTableViewManagerForSection:
             [indexPath section]] tableView:tableView
            cellForIndexPath:[self routedIndexPathForIndexPath:indexPath]];
}

-(void)actionForIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilNoReturn(indexPath);
    [[(id)[self routedTableViewManagerForSection:[indexPath section]]
      ERN_guaranteeSelectorResponse:@selector(actionForIndexPath:)]
     actionForIndexPath:[self routedIndexPathForIndexPath:indexPath]];
}

-(NSString *)titleForFooterInSection:(NSInteger)section
{
    return [self titleForFooterInRoutedSection:[self routedSection:section]
                        routedTableViewManager:[self routedTableViewManagerForSection:section]];
}

-(NSString *)titleForHeaderInSection:(NSInteger)section
{
    return [self titleForHeaderInRoutedSection:[self routedSection:section]
                        routedTableViewManager:[self routedTableViewManagerForSection:section]];
}

-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
                    defaultHeight:(CGFloat)defaultHeight
{
    ERNCheckNilAndReturn(indexPath, defaultHeight);
    return [self heightForRowAtRoutedIndexPath:[self routedIndexPathForIndexPath:indexPath]
                                 defaultHeight:defaultHeight
                        routedTableViewManager:
            [self routedTableViewManagerForSection:[indexPath section]]];
}

-(CGFloat)heightForHeaderInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight
{
    return [self heightForHeaderInRoutedSection:[self routedSection:section]
                                  defaultHeight:defaultHeight
                         routedTableViewManager:[self routedTableViewManagerForSection:section]];
}

-(CGFloat)heightForFooterInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight
{
    return [self heightForFooterInRoutedSection:[self routedSection:section]
                                  defaultHeight:defaultHeight
                         routedTableViewManager:[self routedTableViewManagerForSection:section]];
}

-(UIView *)viewForHeaderInSection:(NSInteger)section
{
    return [self viewForHeaderInRoutedSection:[self routedSection:section]
                       routedTableViewManager:[self routedTableViewManagerForSection:section]];
}

-(UIView *)viewForFooterInSection:(NSInteger)section
{
    return [self viewForFooterInRoutedSection:[self routedSection:section]
                       routedTableViewManager:[self routedTableViewManagerForSection:section]];
}

#pragma mark - private

-(NSString *)titleForFooterInRoutedSection:(NSInteger)routedSection
                    routedTableViewManager:(id<ERNTableViewManager>)routedTableViewManager
{
    return [routedTableViewManager respondsToSelector:@selector(titleForFooterInSection:)] ?
    [routedTableViewManager titleForFooterInSection:routedSection] :
    @"";
}

-(NSString *)titleForHeaderInRoutedSection:(NSInteger)routedSection
                    routedTableViewManager:(id<ERNTableViewManager>)routedTableViewManager
{
    return [routedTableViewManager respondsToSelector:@selector(titleForHeaderInSection:)] ?
    [routedTableViewManager titleForHeaderInSection:routedSection] :
    @"";
}

-(CGFloat)heightForRowAtRoutedIndexPath:(NSIndexPath *)routedIndexPath
                          defaultHeight:(CGFloat)defaultHeight
                 routedTableViewManager:(id<ERNTableViewManager>)routedTableViewManager
{
    return [routedTableViewManager
            respondsToSelector:@selector(heightForRowAtIndexPath:defaultHeight:)] ?
    [routedTableViewManager heightForRowAtIndexPath:routedIndexPath
                                      defaultHeight:defaultHeight] :
    defaultHeight;
}

-(CGFloat)heightForHeaderInRoutedSection:(NSInteger)routedSection
                           defaultHeight:(CGFloat)defaultHeight
                  routedTableViewManager:(id<ERNTableViewManager>)routedTableViewManager
{
    return [routedTableViewManager
            respondsToSelector:@selector(heightForHeaderInSection:defaultHeight:)] ?
    [routedTableViewManager heightForHeaderInSection:routedSection
                                       defaultHeight:defaultHeight] :
    defaultHeight;
}

-(CGFloat)heightForFooterInRoutedSection:(NSInteger)routedSection
                           defaultHeight:(CGFloat)defaultHeight
                  routedTableViewManager:(id<ERNTableViewManager>)routedTableViewManager
{
    return [routedTableViewManager
            respondsToSelector:@selector(heightForFooterInSection:defaultHeight:)] ?
    [routedTableViewManager heightForFooterInSection:routedSection
                                       defaultHeight:defaultHeight] :
    defaultHeight;
}

-(UIView *)viewForHeaderInRoutedSection:(NSInteger)routedSection
                 routedTableViewManager:(id<ERNTableViewManager>)routedTableViewManager
{
    return [routedTableViewManager respondsToSelector:@selector(viewForHeaderInSection:)] ?
    [routedTableViewManager viewForHeaderInSection:routedSection] :
    nil;
}

-(UIView *)viewForFooterInRoutedSection:(NSInteger)routedSection
                 routedTableViewManager:(id<ERNTableViewManager>)routedTableViewManager
{
    return [routedTableViewManager respondsToSelector:@selector(viewForFooterInSection:)] ?
    [routedTableViewManager viewForFooterInSection:routedSection] :
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

#pragma mark - private - initializers

-(id)initWithFirstTableViewManager:(id<ERNTableViewManager>)firstTableViewManager
              restTableViewManager:(id<ERNTableViewManager>)restTableViewManager
{
    self = [self init];
    ERNCheckNil(self);
    _firstTableViewManager = firstTableViewManager;
    _restTableViewManager = restTableViewManager;
    return self;
}

@end
