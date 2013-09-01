#import <Foundation/Foundation.h>

@protocol ERNAction;
@protocol ERNObjectAction;
@protocol ERNRepositoryFactory;
@protocol ERNResourceFactory;
@class ERNMutableApplication;
@protocol ERNTableViewCellFactory;
@protocol ERNTableViewItemManager;

@interface ERNApplication : NSObject
@property (nonatomic, readonly) id<ERNRepositoryFactory> repositoryFactory;
@property (nonatomic, readonly) id<ERNObjectAction> objectAction;
@property (nonatomic, readonly) id<ERNAction> action;
@property (nonatomic, readonly) id<ERNTableViewCellFactory> cellFactory;
@property (nonatomic, readonly) id<ERNTableViewItemManager> itemManager;
-(ERNMutableApplication *)mutableCopy;
-(ERNApplication *)copy;
+(instancetype)create;
@end

@interface ERNMutableApplication : ERNApplication
-(void)setRepositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
                    forMime:(NSString *)mime;
-(void)setResourceFactory:(id<ERNResourceFactory>)resourceFactory
                 forClass:(Class)resourceClass;
-(void)setAction:(id<ERNAction>)action
         forMime:(NSString *)mime;
-(void)setCellFactory:(id<ERNTableViewCellFactory>)cellFactory
             forClass:(Class)resourceClass;
@end
