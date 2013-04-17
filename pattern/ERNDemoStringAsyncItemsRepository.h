#import <Foundation/Foundation.h>
#import "ERNAsyncItemsRepository.h"
#import "ERNBaseAsyncRepository.h"

@interface ERNDemoStringAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncItemsRepository>
+(instancetype)asyncItemsRepository;
+(instancetype)asyncItemsRepositoryWithItems:(NSArray *)items;
@end
