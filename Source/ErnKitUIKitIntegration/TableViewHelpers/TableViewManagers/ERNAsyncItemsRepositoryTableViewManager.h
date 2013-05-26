#import <Foundation/Foundation.h>
#import "ERNTableViewManager.h"

@protocol ERNAsyncPaginatedItemsRepository;
@protocol ERNTableViewItemManager;

@interface ERNAsyncItemsRepositoryTableViewManager : NSObject <ERNTableViewManager>
+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                        itemManager:(id<ERNTableViewItemManager>)itemManager;
@end
