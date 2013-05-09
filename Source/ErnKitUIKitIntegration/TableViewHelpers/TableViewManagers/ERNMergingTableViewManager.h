#import <Foundation/Foundation.h>
#import "ERNTableViewManager.h"

@interface ERNMergingTableViewManager : NSObject <ERNTableViewManager>
+(instancetype)createWithFirstTableViewManager:(id<ERNTableViewManager>)firstTableViewManager
                          restTableViewManager:(id<ERNTableViewManager>)restTableViewManager;
@end
