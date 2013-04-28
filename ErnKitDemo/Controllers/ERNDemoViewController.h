#import <UIKit/UIKit.h>

@protocol ERNAsyncItemsRepository;

@interface ERNDemoViewController : UIViewController
+(instancetype)viewControllerWithTableViewDelegate:(id<UITableViewDelegate>)tableViewDelegate
                               tableViewDataSource:(id<UITableViewDataSource>)tableViewDataSource
                                        repository:(id<ERNAsyncItemsRepository>)repository;
@end
