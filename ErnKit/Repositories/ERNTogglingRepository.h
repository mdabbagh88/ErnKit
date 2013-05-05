#import "ERNBaseAsyncRepository.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNToggler.h"

@interface ERNTogglingRepository : ERNBaseAsyncRepository <ERNAsyncItemsRepository, ERNToggler>
+(instancetype)repositoryWithRepositories:(NSArray *)repositories;
@end
