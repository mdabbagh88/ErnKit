#import <UIKit/UIKit.h>
#import "ERNDemoTableViewManager.h"
#import "ERNErrorHandler.h"

@interface ERNDemoTableViewManager ()
@property (nonatomic, readonly, copy) NSString *text;
@end

@implementation ERNDemoTableViewManager

-(UITableViewCell *)tableView:(UITableView *)tableView
             cellForIndexPath:(NSIndexPath *)indexPath
{
    return [self setupCell:[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:[self text]]];
}

-(UITableViewCell *)setupCell:(UITableViewCell *)cell
{
    [[cell textLabel] setText:[self text]];
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
    self = [self init];
    ERNCheckNil(self);
    _text = text;
    return self;
}

+(instancetype)tableViewManagerWithText:(NSString *)text
{
    return [[self alloc] initWithText:text];
}

@end
