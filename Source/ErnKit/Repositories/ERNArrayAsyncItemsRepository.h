#import <Foundation/Foundation.h>
#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNBaseAsyncRepository.h"

@interface ERNArrayAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncItemsRepository>
@property (nonatomic, copy) NSArray *array;
+(instancetype)createWithArray:(NSArray *)array;
@end
