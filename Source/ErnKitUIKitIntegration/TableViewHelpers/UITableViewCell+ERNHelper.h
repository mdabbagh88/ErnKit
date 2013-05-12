#import <UIKit/UIKit.h>

@interface UITableViewCell (ERNHelper)

+(instancetype)createForTableView:(UITableView *)tableView
                            style:(UITableViewCellStyle)style;
+(instancetype)createWithStyle:(UITableViewCellStyle)style;
@end
