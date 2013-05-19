#import "ERNConverterAsyncRepository.h"
#import "ERNAsyncPaginatedItemsRepository.h"

@interface ERNItemsToAsyncPaginatedItemsRepository : ERNConverterAsyncRepository <
    ERNAsyncPaginatedItemsRepository>
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository;
@end
