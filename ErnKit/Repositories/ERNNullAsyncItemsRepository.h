#import <Foundation/Foundation.h>
#import "ERNAsyncItemsRepository.h"
#import "ERNBaseAsyncRepository.h"

@interface ERNNullAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncItemsRepository>
+(instancetype)repository;
@end
