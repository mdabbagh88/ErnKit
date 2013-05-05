#import "ERNBaseAsyncRepository.h"
#import "ERNAsyncItemsRepository.h"

@interface ERNRoutingAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncItemsRepository>
+(instancetype)repositoryWithFirstRepository:(id<ERNAsyncItemsRepository>)firstRepository
                              restRepository:(id<ERNAsyncItemsRepository>)restRepository;
@end
