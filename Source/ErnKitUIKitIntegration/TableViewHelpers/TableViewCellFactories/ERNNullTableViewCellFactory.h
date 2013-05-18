#import <Foundation/Foundation.h>
#import "ERNTableViewCellFactory.h"

@interface ERNNullTableViewCellFactory : NSObject <ERNTableViewCellFactory>
+(instancetype)create;
@end
