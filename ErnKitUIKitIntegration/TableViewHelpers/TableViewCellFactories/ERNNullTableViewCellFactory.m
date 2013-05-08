#import "ERNNullTableViewCellFactory.h"
#import "UITableViewCell+ERNHelper.h"
#import "ERNErrorHandler.h"
#import "ERNDummyTableViewCell.h"

static ERNNullTableViewCellFactory *immutableSingleton;

@implementation ERNNullTableViewCellFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNTableViewCellFactory

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    ERNCheckNilAndReturn(object, [ERNDummyTableViewCell create]);
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
    immutableSingleton = [self new];
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
    return [self setupCell:[UITableViewCell createForTableView:tableView
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
