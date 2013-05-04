#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class UITableView;
@class UITableViewCell;

@protocol ERNTableViewCellFactory <NSObject>
-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object;
-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight;
@end
