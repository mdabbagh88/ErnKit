#import <Foundation/Foundation.h>
#import "ERNRepositoryFactory.h"

@interface ERNNullRepositoryFactory : NSObject <ERNRepositoryFactory>
+(instancetype)create;
@end
