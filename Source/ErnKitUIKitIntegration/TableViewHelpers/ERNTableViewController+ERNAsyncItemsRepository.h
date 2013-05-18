#import "ERNTableViewController.h"

@protocol ERNAsyncItemsRepository;
@protocol ERNTableViewItemManager;

@interface ERNTableViewController (ERNAsyncItemsRepository)
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        itemManager:(id<ERNTableViewItemManager>)itemManager;
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   itemManager:(id<ERNTableViewItemManager>)itemManager;
@end
