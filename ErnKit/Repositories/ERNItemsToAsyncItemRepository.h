#import "ERNAsyncItemRepository.h"
#import "ERNConverterAsyncRepository.h"

@protocol ERNAsyncItemsRepository;

@interface ERNItemsToAsyncItemRepository : ERNConverterAsyncRepository <ERNAsyncItemRepository>
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository;
@end
