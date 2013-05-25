#import <Foundation/Foundation.h>
#import "ERNArrayAsyncItemsRepository.h"

@class RKResponseDescriptor;

@interface ERNRestKitAsyncItemsRepository : ERNArrayAsyncItemsRepository <ERNAsyncItemsRepository>
+(instancetype)createWithUrl:(NSURL *)url
          responseDescriptor:(RKResponseDescriptor *)responseDescriptor;
@end
