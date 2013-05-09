#import <Foundation/Foundation.h>
#import "ERNAsyncRepository.h"

@interface ERNConverterAsyncRepository : NSObject <ERNAsyncRepository>
-(id)initWithRepository:(id<ERNAsyncRepository>)repository;
@end
