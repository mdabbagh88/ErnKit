#import <Foundation/Foundation.h>
#import "ERNAsyncRepository.h"

@interface ERNConverterAsyncRepository : NSObject <ERNAsyncRepository>
-(id)initWithRepository:(id<ERNAsyncRepository>)repository;
+(instancetype)createWithRepository:(id<ERNAsyncRepository>)repository;
@end
