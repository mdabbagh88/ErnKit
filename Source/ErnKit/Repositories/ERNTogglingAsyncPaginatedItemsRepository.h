#import "ERNBaseAsyncRepository.h"
#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNToggler.h"

@interface ERNTogglingAsyncPaginatedItemsRepository : ERNBaseAsyncRepository <ERNAsyncPaginatedItemsRepository, ERNToggler>
+(instancetype)createWithRepositories:(NSArray *)repositories;
@end
