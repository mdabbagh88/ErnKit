#import <Foundation/Foundation.h>
#import "ERNRepositoryFactory.h"

@interface ERNMimeRoutingRepositoryFactory : NSObject <ERNRepositoryFactory>
+(instancetype)createWithRepositoryFactories:(NSDictionary *)repositoryFactories;
@end
