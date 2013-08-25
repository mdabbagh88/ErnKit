#import <Foundation/Foundation.h>
#import "ERNTableViewItemManager.h"

@protocol ERNTableViewCellFactory;
@protocol ERNObjectAction;

@interface ERNDefaultTableViewItemManager : NSObject <ERNTableViewItemManager>
+(instancetype)createWithCellFactory:(id<ERNTableViewCellFactory>)cellFactory
                        objectAction:(id<ERNObjectAction>)objectAction;
@end
