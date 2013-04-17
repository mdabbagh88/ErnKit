#import <Foundation/Foundation.h>
#import "ERNTableViewManager.h"

@interface ERNRoutingTableViewManager : NSObject <ERNTableViewManager>
+(instancetype)tableViewManagerWithFirstTableViewManager:(id<ERNTableViewManager>)firstTableViewManager
                                    restTableViewManager:(id<ERNTableViewManager>)restTableViewManager;
@end
