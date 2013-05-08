#import <Foundation/Foundation.h>
#import "ERNArrayAsyncItemsRepository.h"

@class RKObjectMapping;

@interface ERNRestKitPagingAsyncItemsRepository : ERNArrayAsyncItemsRepository
+(instancetype)asyncItemsRepositoryWithUrl:(NSURL *)url
                                   keyPath:(NSString *)keyPath
                                   mapping:(RKObjectMapping *)mapping
                               statusCodes:(NSIndexSet *)statusCodes;
+(instancetype)asyncItemsRepositoryWithUrl:(NSURL *)url
                                   keyPath:(NSString *)keyPath
                               pathPattern:(NSString *)pathPattern
                                   mapping:(RKObjectMapping *)mapping
                               statusCodes:(NSIndexSet *)statusCodes;
@end
