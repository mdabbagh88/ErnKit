#import <UIKit/UIKit.h>

@interface ERNDemoViewController : UIViewController
+(instancetype)viewControllerWithTableViewDelegate:(id<UITableViewDelegate>)tableViewDelegate
                               tableViewDataSource:(id<UITableViewDataSource>)tableViewDataSource;
@end
