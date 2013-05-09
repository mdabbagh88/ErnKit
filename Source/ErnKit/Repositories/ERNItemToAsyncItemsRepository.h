#import "ERNAsyncItemsRepository.h"
#import "ERNConverterAsyncRepository.h"

@protocol ERNAsyncItemRepository;

@interface ERNItemToAsyncItemsRepository : ERNConverterAsyncRepository <ERNAsyncItemsRepository>
+(instancetype)createWithRepository:(id<ERNAsyncItemRepository>)repository;
@end
