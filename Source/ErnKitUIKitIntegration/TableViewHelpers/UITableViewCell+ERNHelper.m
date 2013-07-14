#import "UITableViewCell+ERNHelper.h"

@implementation UITableViewCell (ERNHelper)

#pragma mark - public - constructors

+(instancetype)createWithCellReuser:(UITableViewCell *(^)(NSString *identifier))block
                              style:(UITableViewCellStyle)style
{
   return [self createWithCellReuser:block
                          identifier:[NSString stringWithFormat:@"%@%d",
                                      NSStringFromClass([self class]),
                                      style]
                               style:style];
}

#pragma mark - private

+(instancetype)createWithCellReuser:(UITableViewCell *(^)(NSString *identifier))block
                        identifier:(NSString *)identifier
                             style:(UITableViewCellStyle)style
{
    return [self createCell:block(identifier)
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
