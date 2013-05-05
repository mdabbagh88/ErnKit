#import "ERNAsyncItemRepository.h"
#import "ERNConverterAsyncRepository.h"

@protocol ERNAsyncItemsRepository;

@interface ERNItemsToAsyncItemRepository : ERNConverterAsyncRepository <ERNAsyncItemRepository>
+(instancetype)asyncItemRepositoryWithRepository:(id<ERNAsyncItemsRepository>)repository;
@end
