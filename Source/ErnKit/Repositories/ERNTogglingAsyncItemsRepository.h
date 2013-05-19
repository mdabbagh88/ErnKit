#import "ERNBaseAsyncRepository.h"
#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNToggler.h"

@interface ERNTogglingAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncPaginatedItemsRepository, ERNToggler>
+(instancetype)createWithRepositories:(NSArray *)repositories;
@end
