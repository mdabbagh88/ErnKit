#import "UITableViewCell+ERNHelper.h"

@implementation UITableViewCell (ERNHelper)

#pragma mark - public - constructors

+(instancetype)createForTableView:(UITableView *)tableView
                     identifier:(NSString *)identifier
                          style:(UITableViewCellStyle)style
{
    return [self createCell:[tableView dequeueReusableCellWithIdentifier:identifier]
                 identifier:identifier
                      style:style];
}

#pragma mark - private

+(instancetype)createCell:(UITableViewCell *)cell
               identifier:(NSString *)identifier
                    style:(UITableViewCellStyle)style
{
    return cell ? cell : [[self alloc] initWithStyle:style
                                     reuseIdentifier:identifier];
}

@end
