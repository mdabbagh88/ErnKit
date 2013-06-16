#import <Foundation/Foundation.h>
#import "ERNTableViewCellFactory.h"

@interface ERNRoutingTableViewCellFactory : NSObject <ERNTableViewCellFactory>
+(instancetype)createWithMappings:(NSDictionary *)mappings;
@end
