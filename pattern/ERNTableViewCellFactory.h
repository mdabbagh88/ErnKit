#import <UIKit/UIKit.h>

@protocol ERNTableViewCellFactory <NSObject>
-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object;
@end
