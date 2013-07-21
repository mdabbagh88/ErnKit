#import <Foundation/Foundation.h>
#import "ERNRepositoryFactory.h"

@class RKResponseDescriptor;

@interface ERNRestKitAsyncItemRepositoryFactory : NSObject <ERNRepositoryFactory>
+(instancetype)createWithResponseDescriptor:(RKResponseDescriptor *)responseDescriptor;
@end
