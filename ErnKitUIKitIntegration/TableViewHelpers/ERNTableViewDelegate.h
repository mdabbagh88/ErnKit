#import <UIKit/UIKit.h>

@protocol ERNTableViewManager;

@interface ERNTableViewDelegate : NSObject <UITableViewDelegate>
+(instancetype)createWithTableViewManager:(id<ERNTableViewManager>)tableViewManager;
@end
