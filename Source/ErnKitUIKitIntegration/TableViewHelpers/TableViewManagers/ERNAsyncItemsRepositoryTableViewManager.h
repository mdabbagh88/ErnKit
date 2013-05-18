#import <Foundation/Foundation.h>
#import "ERNTableViewManager.h"

@protocol ERNAsyncItemsRepository;
@protocol ERNTableViewItemManager;

@interface ERNAsyncItemsRepositoryTableViewManager : NSObject <ERNTableViewManager>
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository;
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        itemManager:(id<ERNTableViewItemManager>)itemManager;
@end
