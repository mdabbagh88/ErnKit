#import <Foundation/Foundation.h>
#import "ERNAsyncItemRepository.h"
#import "ERNBaseAsyncRepository.h"

@interface ERNObjectAsyncItemRepository : ERNBaseAsyncRepository <ERNAsyncItemRepository>
+(instancetype)createWithItem:(id<NSObject>)item;
@end
