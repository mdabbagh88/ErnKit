#import "UITableViewCell+ERNHelper.h"

@implementation UITableViewCell (ERNHelper)

#pragma mark - public - constructors

+(instancetype)createWithStyle:(UITableViewCellStyle)style
{
    return [self createForTableView:nil
                              style:style];
}

+(instancetype)createForTableView:(UITableView *)tableView
                          style:(UITableViewCellStyle)style
{
   return [self createForTableView:tableView
                        identifier:[NSString stringWithFormat:@"%@%d",
                                    NSStringFromClass([self class]),
                                    style]
                             style:style];
}

#pragma mark - private

+(instancetype)createForTableView:(UITableView *)tableView
                        identifier:(NSString *)identifier
                             style:(UITableViewCellStyle)style
{
    return [self createCell:[tableView dequeueReusableCellWithIdentifier:identifier]
                 identifier:identifier
                      style:style];
}
+(instancetype)createCell:(UITableViewCell *)cell
               identifier:(NSString *)identifier
                    style:(UITableViewCellStyle)style
{
    return cell ? cell : [[self alloc] initWithStyle:style
                                     reuseIdentifier:identifier];
}

@end
