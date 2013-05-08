#import <Foundation/Foundation.h>
#import "ERNTableViewCellFactory.h"

@interface ERNRoutingTableViewCellFactory : NSObject <ERNTableViewCellFactory>
+(instancetype)createWithMappings:(NSDictionary *)mappings;
+(instancetype)createWithMappings:(NSDictionary *)mappings
                   defaultFactory:(id<ERNTableViewCellFactory>)defaultFactory;
@end
