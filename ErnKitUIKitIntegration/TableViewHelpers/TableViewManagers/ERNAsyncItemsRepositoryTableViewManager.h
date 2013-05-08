#import <Foundation/Foundation.h>
#import "ERNTableViewManager.h"

@protocol ERNAsyncItemsRepository;
@protocol ERNTableViewCellFactory;
@protocol ERNActionHandler;

@interface ERNAsyncItemsRepositoryTableViewManager : NSObject <ERNTableViewManager>
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository;
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        cellFactory:(id<ERNTableViewCellFactory>)cellFactory;
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                      actionHandler:(id<ERNActionHandler>)actionHandler;
@end
