#import <Foundation/Foundation.h>
#import "ERNAsyncItemRepository.h"
#import "ERNNullAsyncRepository.h"

@interface ERNNullAsyncItemRepository : ERNNullAsyncRepository <ERNAsyncItemRepository>
+(instancetype)create;
@end
