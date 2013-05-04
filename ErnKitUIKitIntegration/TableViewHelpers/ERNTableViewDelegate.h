#import <UIKit/UIKit.h>

@protocol ERNTableViewManager;

@interface ERNTableViewDelegate : NSObject <UITableViewDelegate>
+(instancetype)tableViewDelegateWithTableViewManager:(id<ERNTableViewManager>)tableViewManager;
@end
