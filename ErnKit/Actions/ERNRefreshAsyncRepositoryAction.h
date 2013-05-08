#import <Foundation/Foundation.h>
#import "ERNAsyncRepository.h"
#import "ERNAction.h"

@interface ERNRefreshAsyncRepositoryAction : NSObject <ERNAction>
+(instancetype)createWithRepository:(id<ERNAsyncRepository>)repository;
@end
