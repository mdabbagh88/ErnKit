#import <UIKit/UIKit.h>

@interface UITableViewCell (ERNHelper)

+(instancetype)cellForTableView:(UITableView *)tableView
                     identifier:(NSString *)identifier
                          style:(UITableViewCellStyle)style;
@end
