#import "ERNTableViewController.h"

@protocol ERNAsyncPaginatedItemsRepository;
@protocol ERNTableViewItemManager;

@interface ERNTableViewController (ERNAsyncItemsRepository)
+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                        itemManager:(id<ERNTableViewItemManager>)itemManager;
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                                   itemManager:(id<ERNTableViewItemManager>)itemManager;
@end
