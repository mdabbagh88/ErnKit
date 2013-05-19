#import "ERNAsyncItemRepository.h"
#import "ERNConverterAsyncRepository.h"

@protocol ERNAsyncPaginatedItemsRepository;

@interface ERNItemsToAsyncItemRepository : ERNConverterAsyncRepository <ERNAsyncItemRepository>
+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository;
@end
