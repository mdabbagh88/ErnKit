#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNConverterAsyncRepository.h"

@protocol ERNAsyncItemRepository;

@interface ERNItemToAsyncItemsRepository : ERNConverterAsyncRepository <ERNAsyncPaginatedItemsRepository>
+(instancetype)createWithRepository:(id<ERNAsyncItemRepository>)repository;
@end
