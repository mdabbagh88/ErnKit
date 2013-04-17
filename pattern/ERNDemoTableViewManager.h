#import <Foundation/Foundation.h>
#import "ERNTableViewManager.h"

@interface ERNDemoTableViewManager : NSObject <ERNTableViewManager>
+(instancetype)tableViewManagerWithText:(NSString *)text;
@end
