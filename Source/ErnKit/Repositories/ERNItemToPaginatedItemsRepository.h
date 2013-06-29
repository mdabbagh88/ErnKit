#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNConverterAsyncRepository.h"

@protocol ERNAsyncItemRepository;

@interface ERNItemToPaginatedItemsRepository : ERNConverterAsyncRepository <ERNAsyncPaginatedItemsRepository>
+(instancetype)createWithRepository:(id<ERNAsyncItemRepository>)repository;
@end
