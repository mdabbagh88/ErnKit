#import "ERNAsyncItemRepository.h"
#import "ERNConverterAsyncRepository.h"

@protocol ERNAsyncPaginatedItemsRepository;

@interface ERNPaginatedItemsToItemRepository : ERNConverterAsyncRepository <ERNAsyncItemRepository>
+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository;
@end
