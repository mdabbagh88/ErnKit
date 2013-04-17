#import <Foundation/Foundation.h>
#import "ERNAsyncRepository.h"

@protocol ERNAsyncItemsRepository <ERNAsyncRepository>
@property (nonatomic, readonly) id<NSFastEnumeration> enumeration;
@property (nonatomic, readonly, assign) NSInteger count;
-(id<NSObject>)itemAtIndex:(NSInteger)index;
@end
