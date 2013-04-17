#import <UIKit/UIKit.h>
#import "ERNNullTableViewCellFactory.h"

@implementation ERNNullTableViewCellFactory

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    UITableViewCell *cell = [self createCellForTableView:tableView];

    cell.textLabel.text = [object description];
    return cell;
}

-(UITableViewCell *)createCellForTableView:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    return cell;
}

+(instancetype)tableViewCellFactory
{
    return [[self alloc] init];
}

@end
