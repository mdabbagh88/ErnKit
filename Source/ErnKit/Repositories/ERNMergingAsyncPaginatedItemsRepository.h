#import "ERNBaseAsyncRepository.h"
#import "ERNAsyncPaginatedItemsRepository.h"

@interface ERNMergingAsyncPaginatedItemsRepository : ERNBaseAsyncRepository <ERNAsyncPaginatedItemsRepository>
+(instancetype)createWithFirstRepository:(id<ERNAsyncPaginatedItemsRepository>)firstRepository
                          restRepository:(id<ERNAsyncPaginatedItemsRepository>)restRepository;
@end
