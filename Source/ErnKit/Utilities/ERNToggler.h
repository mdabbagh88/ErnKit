#import <Foundation/Foundation.h>

@protocol ERNToggler <NSObject>
@property (nonatomic) NSUInteger selectedIndex;
-(void)addObserver:(id)observer
          selector:(SEL)selector;
-(void)removeObserver:(id)observer;
@end
