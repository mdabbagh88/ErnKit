#import <Foundation/Foundation.h>
#import "ERNTableViewManager.h"

@protocol ERNAsyncItemsRepository;
@protocol ERNTableViewCellFactory;
@protocol ERNActionHandler;

@interface ERNAsyncItemsRepositoryTableViewManager : NSObject <ERNTableViewManager>
+(instancetype)tableViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository;
+(instancetype)tableViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                  cellFactory:(id<ERNTableViewCellFactory>)cellFactory;
+(instancetype)tableViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                  cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                                actionHandler:(id<ERNActionHandler>)actionHandler;
@end
