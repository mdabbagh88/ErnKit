#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import <Foundation/Foundation.h>

@interface ERNNullAsyncPaginatedItemsRepository : ERNNullAsyncItemsRepository
<ERNAsyncPaginatedItemsRepository>
+(instancetype)create;
@end
