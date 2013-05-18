#import "ERNTableViewController.h"

@interface ERNTableViewController (Refreshable)
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   itemManager:(id<ERNTableViewItemManager>)itemManager;
@end
