#import <Foundation/Foundation.h>
#import "ERNAsyncItemsRepository.h"

@protocol ERNAsyncPaginatedItemsRepository <ERNAsyncItemsRepository>
@property (nonatomic, readonly, assign) NSUInteger fetched;
@property (nonatomic, readonly, assign) NSUInteger offset;
@end
