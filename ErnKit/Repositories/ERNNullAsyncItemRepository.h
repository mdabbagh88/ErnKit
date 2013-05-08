#import <Foundation/Foundation.h>
#import "ERNAsyncItemRepository.h"
#import "ERNBaseAsyncRepository.h"

@interface ERNNullAsyncItemRepository : ERNBaseAsyncRepository <ERNAsyncItemRepository>
+(instancetype)create;
@end
