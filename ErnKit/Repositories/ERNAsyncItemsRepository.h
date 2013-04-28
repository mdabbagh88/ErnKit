#import <Foundation/Foundation.h>
#import "ERNAsyncRepository.h"

@protocol ERNAsyncItemsRepository <ERNAsyncRepository>
@property (nonatomic, readonly, assign) NSUInteger count;
-(id<NSObject>)itemAtIndex:(NSUInteger)index;
-(void)enumerateItemsUsingBlock:(void (^)(id<NSObject> item, NSUInteger index, BOOL *stop))block;
-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate;
@end
