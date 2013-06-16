#import "ERNAsyncItemsRepository.h"
#import "ERNNullAsyncRepository.h"

@interface ERNNullAsyncItemsRepository : ERNNullAsyncRepository <ERNAsyncItemsRepository>
+(instancetype)create;
@end
