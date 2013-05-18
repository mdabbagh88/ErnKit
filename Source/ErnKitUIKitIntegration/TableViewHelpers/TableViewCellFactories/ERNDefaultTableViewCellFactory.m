#import "ERNDefaultTableViewCellFactory.h"
#import "UITableViewCell+ERNHelper.h"
#import "ERNErrorHandler.h"
#import "ERNNullTableViewCell.h"

static ERNDefaultTableViewCellFactory *immutableSingleton;

@implementation ERNDefaultTableViewCellFactory {
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
    ERNCheckNilAndReturn(object, [ERNNullTableViewCell create]);
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
    return [self setupCell:[UITableViewCell createWithStyle:UITableViewCellStyleDefault]
                    object:object];
}

-(UITableViewCell *)createTableViewCellForTableView:(UITableView *)tableView
                                         fromObject:(id<NSObject>)object
{
    return [self setupCell:[UITableViewCell createForTableView:tableView
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
