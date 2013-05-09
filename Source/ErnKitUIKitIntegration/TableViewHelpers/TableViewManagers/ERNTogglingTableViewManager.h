#import <Foundation/Foundation.h>
#import "ERNTableViewManager.h"
#import "ERNToggler.h"

@interface ERNTogglingTableViewManager : NSObject <ERNTableViewManager, ERNToggler>
+(instancetype)createWithTableViewManagers:(NSArray *)tableViewManagers
                                 tableView:(UITableView *)tableView;
@end
