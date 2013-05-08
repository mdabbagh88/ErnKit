#import <UIKit/UIKit.h>

@protocol ERNTableViewManager;

@interface ERNTableViewDataSource : NSObject <UITableViewDataSource>
+(instancetype)createWithTableViewManager:(id<ERNTableViewManager>)tableViewManager;
@end
