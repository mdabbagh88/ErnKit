#import <UIKit/UIKit.h>

@protocol ERNTableViewItemManager;
@protocol ERNAsyncItemsRepository;

@interface ERNTableViewController : UITableViewController
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        itemManager:(id<ERNTableViewItemManager>)itemManager;
@end
