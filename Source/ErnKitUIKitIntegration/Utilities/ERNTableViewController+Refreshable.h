#import "ERNTableViewController.h"

@interface ERNTableViewController (Refreshable)
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository;
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   cellFactory:(id<ERNTableViewCellFactory>)cellFactory;
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                 actionHandler:(id<ERNActionHandler>)actionHandler;
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                                 actionHandler:(id<ERNActionHandler>)actionHandler;
@end
