#import <Foundation/Foundation.h>

@protocol ERNObservable <NSObject>
-(void)addObserver:(id)observer
          selector:(SEL)selector;
-(void)removeObserver:(id)observer;
@end
