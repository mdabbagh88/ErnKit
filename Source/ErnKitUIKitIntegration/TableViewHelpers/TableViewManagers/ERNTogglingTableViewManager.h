#import <Foundation/Foundation.h>
#import "ERNTableViewManager.h"
#import "ERNToggler.h"
#import "ERNBaseObservable.h"

@interface ERNTogglingTableViewManager : ERNBaseObservable <ERNTableViewManager, ERNToggler>
+(instancetype)createWithTableViewManagers:(NSArray *)tableViewManagers
                                 tableView:(UITableView *)tableView;
@end
