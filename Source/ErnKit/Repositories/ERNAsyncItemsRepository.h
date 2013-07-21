#import <Foundation/Foundation.h>
#import "ERNAsyncItemRepository.h"

typedef void (^ERNRepositoryEnumerationBlock)(id<NSObject> item, NSUInteger index, BOOL *stop);

@protocol ERNAsyncItemsRepository <ERNAsyncItemRepository>
@property (nonatomic, readonly, assign) NSUInteger count;
-(id<NSObject>)itemAtIndex:(NSUInteger)index;
-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block;
-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate;
@end
