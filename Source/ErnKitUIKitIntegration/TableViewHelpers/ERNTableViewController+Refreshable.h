#import "ERNTableViewController.h"

@interface ERNTableViewController (Refreshable)
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   cellFactory:(id<ERNTableViewCellFactory>)cellFactory;
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                                 actionHandler:(id<ERNActionHandler>)actionHandler;
@end
