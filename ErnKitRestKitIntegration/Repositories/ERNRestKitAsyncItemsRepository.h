#import <Foundation/Foundation.h>
#import "ERNArrayAsyncItemsRepository.h"
#import <RestKit/RestKit.h>

@interface ERNRestKitAsyncItemsRepository : ERNArrayAsyncItemsRepository <ERNAsyncItemsRepository>
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
