#import <Foundation/Foundation.h>
#import "ERNItemRepositoryFactory.h"

@class RKResponseDescriptor;

@interface ERNRestKitAsyncItemRepositoryFactory : NSObject <ERNItemRepositoryFactory>
+(instancetype)createWithResponseDescriptor:(RKResponseDescriptor *)responseDescriptor;
@end
