#import <Foundation/Foundation.h>

@protocol ERNBinaryToggle <NSObject>
@property (nonatomic) BOOL selected;
-(void)addObserver:(id)observer
          selector:(SEL)selector;
-(void)removeObserver:(id)observer;
@end
