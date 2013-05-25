#import <Foundation/Foundation.h>
#import "ERNAsyncItemsRepository.h"

@protocol ERNAsyncPaginatedItemsRepository <ERNAsyncItemsRepository>
@property (nonatomic, readonly, assign) NSUInteger total;
@property (nonatomic, readonly, assign) NSUInteger offset;
@property (nonatomic, readonly, assign) BOOL hasNext;
@property (nonatomic, readonly, assign) BOOL hasPrevious;
-(void)fetchNext;
-(void)fetchPrevious;
@end
