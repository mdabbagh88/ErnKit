#import <Foundation/Foundation.h>
#import "ERNViewControllerConfigurator.h"

@protocol ERNTableViewItemManager;
@protocol ERNRepositoryFactory;

@interface ERNRefreshableListConfigurator : NSObject <ERNViewControllerConfigurator>
+(instancetype)createWithItemManager:(id<ERNTableViewItemManager>)itemManager
                   repositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
                               title:(NSString *)title;
@end
