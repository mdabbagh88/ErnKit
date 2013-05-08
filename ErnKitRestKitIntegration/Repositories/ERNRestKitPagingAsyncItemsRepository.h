#import <Foundation/Foundation.h>
#import "ERNArrayAsyncItemsRepository.h"

@class RKObjectMapping;

@interface ERNRestKitPagingAsyncItemsRepository : ERNArrayAsyncItemsRepository
+(instancetype)createWithUrl:(NSURL *)url
                     keyPath:(NSString *)keyPath
                     mapping:(RKObjectMapping *)mapping
                 statusCodes:(NSIndexSet *)statusCodes;
+(instancetype)createWithUrl:(NSURL *)url
                     keyPath:(NSString *)keyPath
                 pathPattern:(NSString *)pathPattern
                     mapping:(RKObjectMapping *)mapping
                 statusCodes:(NSIndexSet *)statusCodes;
@end
