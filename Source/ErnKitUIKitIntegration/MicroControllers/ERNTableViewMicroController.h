#import <Foundation/Foundation.h>

@class UIView;
@class UITableView;
@protocol UITableViewDataSource;
@protocol UITableViewDelegate;

@interface ERNTableViewMicroController : NSObject
@property (nonatomic, readonly) UITableView *tableView;
+(instancetype)createWithTableViewDelegate:(id<UITableViewDelegate>)delegate
                       tableViewDataSource:(id<UITableViewDataSource>)dataSource
                                 superView:(UIView *)superView;
@end
