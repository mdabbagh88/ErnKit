#import <Foundation/Foundation.h>
#import "ERNArrayAsyncItemsRepository.h"

@protocol ERNRepositoryFactory;
@class ERNResource;

@interface ERNDefaultAsyncPaginatedItemsRepository : ERNArrayAsyncItemsRepository <
ERNAsyncPaginatedItemsRepository>
+(instancetype)createWithResource:(ERNResource *)resource
                repositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
                       windowSize:(NSUInteger)windowSize;
@end
