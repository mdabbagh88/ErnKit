#import <Foundation/Foundation.h>
#import <ERNKit/ErnKit.h>
#import <ERNKit/UIKitIntegration.h>

@interface ERNRefreshableListConfigurator : NSObject <ERNViewControllerConfigurator>
+(instancetype)createWithItemManager:(id<ERNTableViewItemManager>)itemManager
                   repositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
                               title:(NSString *)title;
@end
