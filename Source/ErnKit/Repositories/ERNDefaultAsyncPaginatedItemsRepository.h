#import <Foundation/Foundation.h>
#import "ERNArrayAsyncItemsRepository.h"

@protocol ERNItemRepositoryFactory;
@class ERNResource;

@interface ERNDefaultAsyncPaginatedItemsRepository : ERNArrayAsyncItemsRepository <
ERNAsyncPaginatedItemsRepository>
+(instancetype)createWithResource:(ERNResource *)resource
            itemRepositoryFactory:(id<ERNItemRepositoryFactory>)itemRepositoryFactory
                       windowSize:(NSUInteger)windowSize;
@end
