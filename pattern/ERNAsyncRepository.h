#import <Foundation/Foundation.h>

@protocol ERNAsyncRepository <NSObject>
- (void)addObserver:(id)observer
           selector:(SEL)selector;
- (void)removeObserver:(id)observer;
@end
