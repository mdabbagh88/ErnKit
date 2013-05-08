#import <Foundation/Foundation.h>
#import "ERNAsyncItemsRepository.h"
#import "ERNBaseAsyncRepository.h"

@interface ERNArrayAsyncItemsRepository : ERNBaseAsyncRepository <ERNAsyncItemsRepository>
@property (nonatomic, copy) NSArray *array;
+(instancetype)asyncItemsRepositoryWithArray:(NSArray *)array;
@end
