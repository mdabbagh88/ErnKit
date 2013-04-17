#import "ERNTableViewDelegate.h"
#import "ERNTableViewManager.h"

@interface ERNTableViewDelegate ()
@property (nonatomic, readonly) id<ERNTableViewManager> tableViewManager;
@end

@implementation ERNTableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = [tableView rowHeight];
    id<ERNTableViewManager> tableViewManager = [self tableViewManager];
    if ([tableViewManager respondsToSelector:@selector(heightForRowAtIndexPath:defaultHeight:)]) {
        height = [tableViewManager heightForRowAtIndexPath:indexPath
                                             defaultHeight:height];
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    CGFloat height = 0;
    id<ERNTableViewManager> tableViewManager = [self tableViewManager];
    if ([tableViewManager respondsToSelector:@selector(heightForHeaderInSection:)]) {
        height = [tableViewManager heightForHeaderInSection:section
                                                     defaultHeight:height];
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section
{
    CGFloat height = 0;
    id<ERNTableViewManager> tableViewManager = [self tableViewManager];
    if ([tableViewManager respondsToSelector:@selector(heightForFooterInSection:)]) {
        height = [tableViewManager heightForFooterInSection:section
                                                     defaultHeight:0];
    }
    return height;
}

- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section
{
    UIView *view = nil;
    id<ERNTableViewManager> tableViewManager = [self tableViewManager];
    if ([tableViewManager respondsToSelector:@selector(viewForHeaderInSection:)]) {
        view = [tableViewManager viewForHeaderInSection:section];
    }
    return view;

}

- (UIView *)tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section
{
    UIView *view = nil;
    id<ERNTableViewManager> tableViewManager = [self tableViewManager];
    if ([tableViewManager respondsToSelector:@selector(viewForFooterInSection:)]) {
        view = [tableViewManager viewForFooterInSection:section];
    }
    return view;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    id<ERNTableViewManager> tableViewManager = [self tableViewManager];
    if ([tableViewManager respondsToSelector:@selector(actionForIndexPath:)]) {
        [tableViewManager actionForIndexPath:indexPath];
    }
}

-(id)initWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    self = [super init];
    _tableViewManager = tableViewManager;
    return self;
}

+(instancetype)tableViewDelegateWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    return [[self alloc] initWithTableViewManager:tableViewManager];
}

@end
