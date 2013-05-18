#import "ERNNullTableViewItemManager.h"
#import "ERNNullTableViewCell.h"

@implementation ERNNullTableViewItemManager {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNTableViewItemManager

-(void)actionForObject:(id<NSObject>)object
{
}

-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight
{
    return defaultHeight;
}

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    return [ERNNullTableViewCell create];
}

@end
