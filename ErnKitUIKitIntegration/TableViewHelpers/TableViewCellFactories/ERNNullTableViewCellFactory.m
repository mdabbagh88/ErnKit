#import "ERNNullTableViewCellFactory.h"
#import "UITableViewCell+ERNHelper.h"
#import "ERNErrorHandler.h"
#import "ERNDummyTableViewCell.h"

static ERNNullTableViewCellFactory *factory;

@implementation ERNNullTableViewCellFactory {
}

#pragma mark - public - constructors

+(instancetype)tableViewCellFactory
{
    return factory;
}

#pragma mark - ERNTableViewCellFactory

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    ERNCheckNilAndReturn(object, [ERNDummyTableViewCell dummyCell]);
    ERNCheckNilAndReturn(tableView, [self createTableViewCellFromObject:object]);
    return [self createTableViewCellForTableView:tableView
                                      fromObject:object];
}

-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight
{
    return defaultHeight;
}

#pragma mark - NSObject

+(void)initialize
{
    factory = [[self alloc] init];
}

#pragma mark - private

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

@end
