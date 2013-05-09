#import <Foundation/Foundation.h>
#import "ERNAsyncRepository.h"

typedef void (^ERNRepositoryEnumerationBlock)(id<NSObject> item, NSUInteger index, BOOL *stop);

@protocol ERNAsyncItemsRepository <ERNAsyncRepository>
@property (nonatomic, readonly, assign) NSUInteger count;
@property (nonatomic, readonly, assign) NSUInteger limit;
@property (nonatomic, readonly, assign) NSUInteger offset;
-(id<NSObject>)itemAtIndex:(NSUInteger)index;
-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block;
-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate;
@end
