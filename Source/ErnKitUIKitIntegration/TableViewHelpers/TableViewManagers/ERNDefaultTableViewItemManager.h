#import <Foundation/Foundation.h>
#import "ERNTableViewItemManager.h"

@protocol ERNTableViewCellFactory;
@protocol ERNActionHandler;

@interface ERNDefaultTableViewItemManager : NSObject <ERNTableViewItemManager>
+(instancetype)createWithCellFactory:(id<ERNTableViewCellFactory>)cellFactory
                       actionHandler:(id<ERNActionHandler>)actionHandler;
+(instancetype)createWithActionHandler:(id<ERNActionHandler>)actionHandler;
+(instancetype)createWithCellFactory:(id<ERNTableViewCellFactory>)cellFactory;
@end
