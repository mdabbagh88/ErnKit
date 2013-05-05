#import "ERNAsyncItemsRepository.h"
#import "ERNConverterAsyncRepository.h"

@protocol ERNAsyncItemRepository;

@interface ERNItemToAsyncItemsRepository : ERNConverterAsyncRepository <ERNAsyncItemsRepository>
+(instancetype)asyncItemsRepositoryWithRepository:(id<ERNAsyncItemRepository>)repository;
@end
