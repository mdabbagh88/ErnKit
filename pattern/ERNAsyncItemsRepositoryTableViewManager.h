#import <Foundation/Foundation.h>
#import "ERNTableViewManager.h"

@protocol ERNAsyncItemsRepository;
@protocol ERNTableViewCellFactory;
@protocol ERNAction;
@protocol ERNUrlMimeFactory;

@interface ERNAsyncItemsRepositoryTableViewManager : NSObject <ERNTableViewManager>
+(instancetype)tableViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                  cellFactory:(id<ERNTableViewCellFactory>)cellFactory;
+(instancetype)tableViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                  cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                                       action:(id<ERNAction>)action
                               urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory;
@end
