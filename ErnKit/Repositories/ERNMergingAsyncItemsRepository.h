#import "ERNBaseAsyncRepository.h"
#import "ERNAsyncItemsRepository.h"

@interface ERNMergingAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncItemsRepository>
+(instancetype)repositoryWithFirstRepository:(id<ERNAsyncItemsRepository>)firstRepository
                              restRepository:(id<ERNAsyncItemsRepository>)restRepository;
@end
