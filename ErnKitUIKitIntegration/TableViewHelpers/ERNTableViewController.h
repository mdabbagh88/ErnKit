#import <UIKit/UIKit.h>

@protocol ERNAsyncItemsRepository;
@protocol ERNTableViewCellFactory;
@protocol ERNActionHandler;

@interface ERNTableViewController : UITableViewController
@property (nonatomic) NSArray *subControllers;
+(instancetype)viewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository;
+(instancetype)viewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                cellFactory:(id<ERNTableViewCellFactory>)cellFactory;
+(instancetype)viewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                              actionHandler:(id<ERNActionHandler>)actionHandler;
+(instancetype)refreshableViewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository;
+(instancetype)refreshableViewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                           cellFactory:(id<ERNTableViewCellFactory>)cellFactory;
+(instancetype)refreshableViewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                           cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                                         actionHandler:(id<ERNActionHandler>)actionHandler;
@end
