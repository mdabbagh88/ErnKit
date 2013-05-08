#import <UIKit/UIKit.h>

@interface UITableViewCell (ERNHelper)

+(instancetype)createForTableView:(UITableView *)tableView
                       identifier:(NSString *)identifier
                            style:(UITableViewCellStyle)style;
@end
