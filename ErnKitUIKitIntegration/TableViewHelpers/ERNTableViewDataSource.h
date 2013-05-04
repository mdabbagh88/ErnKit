#import <UIKit/UIKit.h>

@protocol ERNTableViewManager;

@interface ERNTableViewDataSource : NSObject <UITableViewDataSource>
+(instancetype)tableViewDataSourceWithTableViewManager:(id<ERNTableViewManager>)tableViewManager;
@end
