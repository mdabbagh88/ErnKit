#import <UIKit/UIKit.h>
#import "ERNAsyncItemRepository.h"
#import "ERNBaseAsyncRepository.h"

@interface ERNObjectAsyncItemRepository : ERNBaseAsyncRepository <ERNAsyncItemRepository>
+(instancetype)repositoryWithItem:(id<NSObject>)item;
@end
