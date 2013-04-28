#import <Foundation/Foundation.h>
#import "ERNAsyncRepository.h"

@protocol ERNAsyncItemRepository <ERNAsyncRepository>
@property (nonatomic, readonly) id<NSObject> item;
@end
