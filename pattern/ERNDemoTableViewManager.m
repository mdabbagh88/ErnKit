#import "ERNDemoTableViewManager.h"

@interface ERNDemoTableViewManager ()
@property (nonatomic, readonly, copy) NSString *text;
@end

@implementation ERNDemoTableViewManager

-(UITableViewCell *)tableView:(UITableView *)tableView
             cellForIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:[self text]];
    cell.textLabel.text = [self text];
    return cell;
}

-(NSInteger)sections
{
    return 1;
}

-(NSInteger)rowsInSection:(NSInteger)section
{
    return 5;
}

-(id)initWithText:(NSString *)text
{
    self = [super init];
    _text = text;
    return self;
}

+(instancetype)tableViewManagerWithText:(NSString *)text
{
    return [[self alloc] initWithText:text];
}

@end
