#import <UIKit/UIKit.h>

@protocol ERNTableViewManager;

@interface ERNTableViewController : UITableViewController
+(instancetype)createWithTableViewManager:(id<ERNTableViewManager>)tableViewManager;
@end
