#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "ERNMergingTableViewManager.h"
#import "ERNErrorHandler.h"
#import "NSObject+ERNHelper.h"
#import "ERNNullTableViewCell.h"
#import "ERNNullTableViewManager.h"

@interface ERNMergingTableViewManager ()
@property (nonatomic, readonly) id<ERNTableViewManager> firstTableViewManager;
@property (nonatomic, readonly) id<ERNTableViewManager> restTableViewManager;
@end

@implementation ERNMergingTableViewManager {
    id<ERNTableViewManager> _firstTableViewManager;
    id<ERNTableViewManager> _restTableViewManager;
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
            rowsInSection:routedSection(section)];
}

-(UITableViewCell *)cellForIndexPath:(NSIndexPath *)indexPath
                          cellReuser:(UITableViewCell *(^)(NSString *identifier))block
{
    ERNCheckNilAndReturn(indexPath, [ERNNullTableViewCell create]);
    return [[self routedTableViewManagerForSection:
             [indexPath section]] cellForIndexPath:routedIndexPathForIndexPath(indexPath)
                                        cellReuser:block];
}

-(void)actionForIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilNoReturn(indexPath);
    [[(id)[self routedTableViewManagerForSection:[indexPath section]]
      ERN_guaranteeSelectorResponse:@selector(actionForIndexPath:)]
     actionForIndexPath:routedIndexPathForIndexPath(indexPath)];
}

-(NSString *)titleForFooterInSection:(NSInteger)section
{
    return titleForFooter(routedSection(section),
                          [self routedTableViewManagerForSection:section]);
}

-(NSString *)titleForHeaderInSection:(NSInteger)section
{
    return titleForHeader(routedSection(section),
                          [self routedTableViewManagerForSection:section]);
}

-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
                    defaultHeight:(CGFloat)defaultHeight
{
    ERNCheckNilAndReturn(indexPath, defaultHeight);
    return heightForRow(routedIndexPathForIndexPath(indexPath),
                        defaultHeight,
                        [self routedTableViewManagerForSection:[indexPath section]]);
}

-(CGFloat)heightForHeaderInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight
{
    return heightForHeader(routedSection(section),
                           defaultHeight,
                           [self routedTableViewManagerForSection:section]);
}

-(CGFloat)heightForFooterInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight
{
    return heightForFooter(routedSection(section),
                           defaultHeight,
                           [self routedTableViewManagerForSection:section]);
}

-(UIView *)viewForHeaderInSection:(NSInteger)section
{
    return viewForHeader(routedSection(section), [self routedTableViewManagerForSection:section]);
}

-(UIView *)viewForFooterInSection:(NSInteger)section
{
    return viewForFooter(routedSection(section), [self routedTableViewManagerForSection:section]);
}

#pragma mark - private

static NSString *titleForFooter(NSInteger routedSection,
                                id<ERNTableViewManager> routedTableViewManager)
{
    return [routedTableViewManager respondsToSelector:@selector(titleForFooterInSection:)] ?
    [routedTableViewManager titleForFooterInSection:routedSection] :
    @"";
}

static NSString *titleForHeader(NSInteger routedSection,
                                id<ERNTableViewManager> routedTableViewManager)
{
    return [routedTableViewManager respondsToSelector:@selector(titleForHeaderInSection:)] ?
    [routedTableViewManager titleForHeaderInSection:routedSection] :
    @"";
}

static CGFloat heightForRow(NSIndexPath *routedIndexPath,
                            CGFloat defaultHeight,
                            id<ERNTableViewManager> routedTableViewManager)
{
    return [routedTableViewManager
            respondsToSelector:@selector(heightForRowAtIndexPath:defaultHeight:)] ?
    [routedTableViewManager heightForRowAtIndexPath:routedIndexPath
                                      defaultHeight:defaultHeight] :
    defaultHeight;
}

static CGFloat heightForHeader(NSInteger routedSection,
                            CGFloat defaultHeight,
                            id<ERNTableViewManager> routedTableViewManager)
{
    return [routedTableViewManager
            respondsToSelector:@selector(heightForHeaderInSection:defaultHeight:)] ?
    [routedTableViewManager heightForHeaderInSection:routedSection
                                       defaultHeight:defaultHeight] :
    defaultHeight;
}

static CGFloat heightForFooter(NSInteger routedSection,
                               CGFloat defaultHeight,
                               id<ERNTableViewManager> routedTableViewManager)
{
    return [routedTableViewManager
            respondsToSelector:@selector(heightForFooterInSection:defaultHeight:)] ?
    [routedTableViewManager heightForFooterInSection:routedSection
                                       defaultHeight:defaultHeight] :
    defaultHeight;
}

static UIView *viewForHeader(NSInteger routedSection,
                             id<ERNTableViewManager> routedTableViewManager)
{
    return [routedTableViewManager respondsToSelector:@selector(viewForHeaderInSection:)] ?
    [routedTableViewManager viewForHeaderInSection:routedSection] :
    nil;
}

static UIView *viewForFooter(NSInteger routedSection,
                             id<ERNTableViewManager> routedTableViewManager)
{
    return [routedTableViewManager respondsToSelector:@selector(viewForFooterInSection:)] ?
    [routedTableViewManager viewForFooterInSection:routedSection] :
    nil;
}

-(id<ERNTableViewManager>)routedTableViewManagerForSection:(NSInteger)section
{
    return section == 0 ? [self firstTableViewManager] : [self restTableViewManager];
}

static NSIndexPath *routedIndexPathForIndexPath(NSIndexPath *indexPath)
{
    return [indexPath section] == 0 ? indexPath : restIndexPathForIndexPath(indexPath);
}

static NSInteger routedSection(NSInteger section)
{
    return section == 0 ? section : restSectionForSection(section);
}

static NSIndexPath *restIndexPathForIndexPath(NSIndexPath *indexPath)
{
    return [NSIndexPath indexPathForRow:[indexPath row]
                              inSection:[indexPath section] - 1];
}

static NSInteger restSectionForSection(NSInteger section)
{
    return section - 1;
}

-(id<ERNTableViewManager>)firstTableViewManager
{
    return _firstTableViewManager = _firstTableViewManager ? _firstTableViewManager :
    [ERNNullTableViewManager create];
}

-(id<ERNTableViewManager>)restTableViewManager
{
    return _restTableViewManager = _restTableViewManager ? _restTableViewManager :
    [ERNNullTableViewManager create];
}

#pragma mark - private - initializers

-(id)initWithFirstTableViewManager:(id<ERNTableViewManager>)firstTableViewManager
              restTableViewManager:(id<ERNTableViewManager>)restTableViewManager
{
    self = [super init];
    ERNCheckNil(self);
    _firstTableViewManager = firstTableViewManager;
    _restTableViewManager = restTableViewManager;
    return self;
}

@end
