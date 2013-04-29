#import <UIKit/UIKit.h>
#import "ERNNullTableViewCellFactory.h"
#import "UITableViewCell+ERNHelper.h"

@implementation ERNNullTableViewCellFactory

static ERNNullTableViewCellFactory *factory;

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    return [self setupCell:[UITableViewCell cellForTableView:tableView
                                                  identifier:NSStringFromClass([object class])
                                                       style:UITableViewCellStyleDefault] object:object];
}

-(UITableViewCell *)setupCell:(UITableViewCell *)cell
                       object:(id<NSObject>)object
{
    [[cell textLabel] setText:[object description]];
    return cell;
}

-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight
{
    return defaultHeight;
}

+(instancetype)tableViewCellFactory
{
    return factory;
}

+(void)initialize
{
    factory = [[self alloc] init];
}

@end
