#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@protocol ERNTableViewManager <NSObject>
-(UITableViewCell *)tableView:(UITableView *)tableView
             cellForIndexPath:(NSIndexPath *)indexPath;
-(NSInteger)sections;
-(NSInteger)rowsInSection:(NSInteger)section;
@optional
-(void)actionForIndexPath:(NSIndexPath *)indexPath;
-(NSString *)titleForFooterInSection:(NSInteger)section;
-(NSString *)titleForHeaderInSection:(NSInteger)section;
-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
                    defaultHeight:(CGFloat)defaultHeight;
-(CGFloat)heightForHeaderInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight;
-(CGFloat)heightForFooterInSection:(NSInteger)section
                     defaultHeight:(CGFloat)defaultHeight;
-(UIView *)viewForHeaderInSection:(NSInteger)section;
-(UIView *)viewForFooterInSection:(NSInteger)section;
@end