#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNBaseAsyncRepository.h"

@interface ERNNullAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncPaginatedItemsRepository>
+(instancetype)create;
@end
