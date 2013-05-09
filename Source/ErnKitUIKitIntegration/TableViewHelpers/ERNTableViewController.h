#import <UIKit/UIKit.h>

@protocol ERNAsyncItemsRepository;
@protocol ERNTableViewCellFactory;
@protocol ERNActionHandler;

@interface ERNTableViewController : UITableViewController
@property (nonatomic) NSArray *subControllers;
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository;
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        cellFactory:(id<ERNTableViewCellFactory>)cellFactory;
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                      actionHandler:(id<ERNActionHandler>)actionHandler;
+(instancetype)refreshableViewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository;
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   cellFactory:(id<ERNTableViewCellFactory>)cellFactory;
+(instancetype)createRefreshableWithRepository:(id<ERNAsyncItemsRepository>)repository
                                   cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                                 actionHandler:(id<ERNActionHandler>)actionHandler;
@end
