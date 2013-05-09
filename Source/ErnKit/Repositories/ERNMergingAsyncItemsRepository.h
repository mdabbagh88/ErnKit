#import "ERNBaseAsyncRepository.h"
#import "ERNAsyncItemsRepository.h"

@interface ERNMergingAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncItemsRepository>
+(instancetype)createWithFirstRepository:(id<ERNAsyncItemsRepository>)firstRepository
                          restRepository:(id<ERNAsyncItemsRepository>)restRepository;
@end
