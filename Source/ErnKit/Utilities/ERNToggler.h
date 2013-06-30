#import <Foundation/Foundation.h>
#import "ERNObservable.h"

@protocol ERNToggler <ERNObservable>
@property (nonatomic, assign) NSUInteger selectedIndex;
@end
