#import <Foundation/Foundation.h>
#import "ERNArrayAsyncItemsRepository.h"

@class RKResponseDescriptor;
@class ERNResource;

@interface ERNRestKitAsyncItemsRepository : ERNArrayAsyncItemsRepository <ERNAsyncItemsRepository>
+(instancetype)createWithResource:(ERNResource *)resource
               responseDescriptor:(RKResponseDescriptor *)responseDescriptor;
@end
