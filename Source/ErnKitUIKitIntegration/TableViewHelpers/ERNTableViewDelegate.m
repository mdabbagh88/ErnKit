#import "ERNTableViewDelegate.h"
#import "ERNTableViewManager.h"
#import "ERNErrorHandler.h"
#import "NSObject+ERNHelper.h"
#import "ERNNullTableViewManager.h"

@interface ERNTableViewDelegate ()
@property (nonatomic, readonly) id<ERNTableViewManager> tableViewManager;
@end

@implementation ERNTableViewDelegate {
    id<ERNTableViewManager> _tableViewManager;
}

#pragma mark - public - constructors

+(instancetype)createWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    return [[self alloc] initWithTableViewManager:tableViewManager];
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self heightForRowAtIndexPath:indexPath
                           defaultHeight:[tableView rowHeight]];
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return [self heightForHeaderInSection:section
                            defaultHeight:0];
}

-(CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section
{
    return [self heightForFooterInSection:section
                            defaultHeight:0];
}

-(UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section
{
    return [self canHandleViewForHeaderInSection] ?
    [[self tableViewManager] viewForHeaderInSection:section] :
    nil;
}

-(UIView *)tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section
{
    return [self canHandleViewForFooterInSection] ?
    [[self tableViewManager] viewForFooterInSection:section] :
    nil;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilNoReturn(indexPath);
    if ([[self tableViewManager] respondsToSelector:@selector(actionForIndexPath:)]) {
        [[self tableViewManager] actionForIndexPath:indexPath];
    }
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}

#pragma mark - private

-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
                    defaultHeight:(CGFloat)height
{
    ERNCheckNilAndReturn(indexPath, height);
    return [self canHandleHeightForRowAtIndexPath] ?
    [[self tableViewManager] heightForRowAtIndexPath:indexPath
                                       defaultHeight:height] :
    height;
}

-(BOOL)canHandleHeightForRowAtIndexPath
{
    return [[self tableViewManager]
            respondsToSelector:@selector(heightForRowAtIndexPath:defaultHeight:)];
}

-(CGFloat)heightForHeaderInSection:(NSInteger)section
                     defaultHeight:(CGFloat)height
{
    return [self canHandleHeightForHeaderInSection] ?
    [[self tableViewManager] heightForHeaderInSection:section
                                        defaultHeight:height] :
    height;
}

-(BOOL)canHandleHeightForHeaderInSection
{
    return [[self tableViewManager]
            respondsToSelector:@selector(heightForHeaderInSection:defaultHeight:)];
}

-(CGFloat)heightForFooterInSection:(NSInteger)section
                     defaultHeight:(CGFloat)height
{
    return [self canHandleHeightForFooterInSection] ?
    [[self tableViewManager] heightForFooterInSection:section
                                        defaultHeight:height] :
    height;
}

-(BOOL)canHandleHeightForFooterInSection
{
    return [[self tableViewManager]
            respondsToSelector:@selector(heightForFooterInSection:defaultHeight:)];
}

-(BOOL)canHandleViewForHeaderInSection
{
    return [[self tableViewManager] respondsToSelector:@selector(viewForHeaderInSection:)];
}

-(BOOL)canHandleViewForFooterInSection
{
    return [[self tableViewManager] respondsToSelector:@selector(viewForFooterInSection:)];
}

#pragma mark - private - accessors

-(id<ERNTableViewManager>)tableViewManager
{
    return _tableViewManager = _tableViewManager ? _tableViewManager :
    [ERNNullTableViewManager create];
}

#pragma mark - private - initializers

-(id)initWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    self = [super init];
    ERNCheckNil(self);
    _tableViewManager = tableViewManager;
    return self;
}

@end
