#import <UIKit/UIKit.h>

@interface UITableViewCell (ERNHelper)

+(instancetype)createForTableView:(UITableView *)tableView
                            style:(UITableViewCellStyle)style;
@end
