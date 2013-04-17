#import <Foundation/Foundation.h>
#import "ERNTableViewCellFactory.h"

@interface ERNRoutingTableViewCellFactory : NSObject <ERNTableViewCellFactory>
+(instancetype)tableViewCellFactory;
+(instancetype)tableViewCellFactoryWithMappings:(NSDictionary *)mappings;
+(instancetype)tableViewCellFactoryWithMappings:(NSDictionary *)mappings
                                 defaultFactory:(id<ERNTableViewCellFactory>)defaultFactory;
@end
