#import "ERNBaseAsyncRepository.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNToggler.h"

@interface ERNTogglingAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncItemsRepository, ERNToggler>
+(instancetype)repositoryWithRepositories:(NSArray *)repositories;
@end
