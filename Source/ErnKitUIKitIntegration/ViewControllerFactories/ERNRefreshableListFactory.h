#import <Foundation/Foundation.h>
#import "ERNViewControllerFactory.h"

@protocol ERNTableViewItemManager;
@protocol ERNRepositoryFactory;

@interface ERNRefreshableListFactory : NSObject <ERNViewControllerFactory>
+(instancetype)createWithItemManager:(id<ERNTableViewItemManager>)itemManager
                   repositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
                               title:(NSString *)title;
@end
