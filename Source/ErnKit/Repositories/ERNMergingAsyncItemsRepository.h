#import "ERNBaseAsyncRepository.h"
#import "ERNAsyncPaginatedItemsRepository.h"

@interface ERNMergingAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncPaginatedItemsRepository>
+(instancetype)createWithFirstRepository:(id<ERNAsyncPaginatedItemsRepository>)firstRepository
                          restRepository:(id<ERNAsyncPaginatedItemsRepository>)restRepository;
@end
