#import <UIKit/UIKit.h>

@protocol ERNTableViewCellFactory <NSObject>
-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object;
-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight;
@end
