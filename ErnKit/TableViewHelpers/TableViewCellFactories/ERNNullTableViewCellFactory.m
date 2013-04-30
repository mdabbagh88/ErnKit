#import <UIKit/UIKit.h>
#import "ERNNullTableViewCellFactory.h"
#import "UITableViewCell+ERNHelper.h"
#import "NSObject+ERNHelper.h"
#import "ERNDummyTableViewCell.h"

@implementation ERNNullTableViewCellFactory

static ERNNullTableViewCellFactory *factory;

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    ERNCheckNilAndReturn(object, [ERNDummyTableViewCell dummyCell]);
    ERNCheckNilAndReturn(tableView, [self createTableViewCellFromObject:object]);
    return [self createTableViewCellForTableView:tableView
                                      fromObject:object];
}

-(UITableViewCell *)createTableViewCellFromObject:(id<NSObject>)object
{
    return [self setupCell:[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:NSStringFromClass([object class])]
                    object:object];
}

-(UITableViewCell *)createTableViewCellForTableView:(UITableView *)tableView
                                         fromObject:(id<NSObject>)object
{
    return [self setupCell:[UITableViewCell cellForTableView:tableView
                                                  identifier:NSStringFromClass([object class])
                                                       style:UITableViewCellStyleDefault]
                    object:object];
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
