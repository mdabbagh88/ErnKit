#import "ERNAsyncItemsRepository.h"
#import "ERNBaseAsyncRepository.h"

@interface ERNNullAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncItemsRepository>
+(instancetype)create;
@end
