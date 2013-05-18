#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class UITableViewCell;
@class UITableView;

@protocol ERNTableViewItemManager <NSObject>
-(void)actionForObject:(id<NSObject>)object;
-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object;
-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight;
@end
