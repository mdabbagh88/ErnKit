#import "ERNTableViewDelegate.h"
#import "ERNTableViewManager.h"
#import "NSObject+ERNHelper.h"

@interface ERNTableViewDelegate ()
@property (nonatomic, readonly) id<ERNTableViewManager> tableViewManager;
@end

@implementation ERNTableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self tableView:tableView
   heightForRowAtIndexPath:indexPath
             defaultHeight:[tableView rowHeight]];
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
      defaultHeight:(CGFloat)height
{
    return [self canHandleHeightForRowAtIndexPath] ?
    [[self tableViewManager] heightForRowAtIndexPath:indexPath
                                       defaultHeight:height] :
    height;
}

-(BOOL)canHandleHeightForRowAtIndexPath
{
    return [[self tableViewManager] respondsToSelector:@selector(heightForRowAtIndexPath:defaultHeight:)];
}


-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return [self tableView:tableView
  heightForHeaderInSection:section
             defaultHeight:0];
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
      defaultHeight:(CGFloat)height
{
    return [self canHandleHeightForHeaderInSection] ?
    [[self tableViewManager] heightForHeaderInSection:section
                                        defaultHeight:height] :
    height;
}

-(BOOL)canHandleHeightForHeaderInSection
{
    return [[self tableViewManager] respondsToSelector:@selector(heightForHeaderInSection:defaultHeight:)];
}

-(CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section
{
    return [self tableView:tableView
  heightForFooterInSection:section
             defaultHeight:0];
}

-(CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section
      defaultHeight:(CGFloat)height
{
    return [self canHandleHeightForFooterInSection] ?
    [[self tableViewManager] heightForFooterInSection:section
                                        defaultHeight:height] :
    height;
}

-(BOOL)canHandleHeightForFooterInSection
{
    return [[self tableViewManager] respondsToSelector:@selector(heightForFooterInSection:defaultHeight:)];
}

-(UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section
{
    return [self canHandleViewForHeaderInSection] ?
    [[self tableViewManager] viewForHeaderInSection:section] :
    nil;
}

-(BOOL)canHandleViewForHeaderInSection
{
    return [[self tableViewManager] respondsToSelector:@selector(viewForHeaderInSection:)];
}

-(UIView *)tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section
{
    return [self canHandleViewForFooterInSection] ?
    [[self tableViewManager] viewForFooterInSection:section] :
    nil;
}

-(BOOL)canHandleViewForFooterInSection
{
    return [[self tableViewManager] respondsToSelector:@selector(viewForFooterInSection:)];
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    [[(id)[self tableViewManager] guaranteeSelectorResponse:@selector(actionForIndexPath:)] actionForIndexPath:indexPath];
}

-(id)initWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    self = [self init];
    ERNCheckNil(self);
    _tableViewManager = tableViewManager;
    return self;
}

+(instancetype)tableViewDelegateWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    return [[self alloc] initWithTableViewManager:tableViewManager];
}

@end
