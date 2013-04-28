#import <Foundation/Foundation.h>
#import "ERNBaseAsyncRepository.h"
#import "ERNAsyncItemsRepository.h"

@interface ERNDemoStringAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncItemsRepository>
+(instancetype)asyncItemsRepository;
@end
