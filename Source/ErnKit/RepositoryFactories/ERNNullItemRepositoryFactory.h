#import <Foundation/Foundation.h>
#import "ERNItemRepositoryFactory.h"

@interface ERNNullItemRepositoryFactory : NSObject <ERNItemRepositoryFactory>
+(instancetype)create;
@end
