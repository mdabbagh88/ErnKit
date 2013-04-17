#import "ERNDemoDemoObjectTableViewCellFactory.h"
#import "ERNDemoObject.h"

@implementation ERNDemoDemoObjectTableViewCellFactory

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    UITableViewCell *cell = nil;
    if ([object isKindOfClass:[ERNDemoObject class]]) {
        ERNDemoObject *demoObject = object;
        cell = [self createCellForTableView:tableView];
        cell.textLabel.text = [demoObject title];
        cell.detailTextLabel.text = [demoObject info];
    }
    return cell;
}

-(UITableViewCell *)createCellForTableView:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:identifier];
    }
    return cell;
}

+(instancetype)tableViewCellFactory
{
    return [[self alloc] init];
}

@end
