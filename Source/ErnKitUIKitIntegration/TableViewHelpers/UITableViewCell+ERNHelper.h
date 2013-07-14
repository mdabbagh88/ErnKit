#import <UIKit/UIKit.h>

@interface UITableViewCell (ERNHelper)

+(instancetype)createWithCellReuser:(UITableViewCell *(^)(NSString *identifier))block
                              style:(UITableViewCellStyle)style;
@end
