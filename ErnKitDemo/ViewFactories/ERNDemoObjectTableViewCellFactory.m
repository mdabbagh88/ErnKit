#import "ERNDemoObjectTableViewCellFactory.h"
#import "ERNDemoObject.h"
#import "UITableViewCell+ERNHelper.h"

@implementation ERNDemoObjectTableViewCellFactory

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(ERNDemoObject *)demoObject
{
    return [self setupCell:[UITableViewCell cellForTableView:tableView
                                                  identifier:NSStringFromClass([demoObject class])
                                                       style:UITableViewCellStyleSubtitle]
                fromObject:demoObject];
}

-(UITableViewCell *)setupCell:(UITableViewCell *)cell
                   fromObject:(ERNDemoObject *)demoObject
{
    [[cell textLabel] setText:[demoObject title]];
    [[cell detailTextLabel] setText:[demoObject info]];
    return cell;
}

-(CGFloat)cellHeightForObject:(ERNDemoObject *)demoObject
                defaultHeight:(CGFloat)defaultHeight
{
    return [demoObject doubleHeight] ? defaultHeight*2 : defaultHeight;
}

+(instancetype)tableViewCellFactory
{
    return [[self alloc] init];
}

@end
