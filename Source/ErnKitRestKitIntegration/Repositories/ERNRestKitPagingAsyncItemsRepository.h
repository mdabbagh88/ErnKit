#import <Foundation/Foundation.h>
#import "ERNArrayAsyncItemsRepository.h"

@class RKResponseDescriptor;

@interface ERNRestKitPagingAsyncItemsRepository : ERNArrayAsyncItemsRepository <
    ERNAsyncPaginatedItemsRepository>
+(instancetype)createWithUrl:(NSURL *)url
          responseDescriptor:(RKResponseDescriptor *)responseDescriptor;
@end
