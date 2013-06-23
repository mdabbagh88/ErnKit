#import <Foundation/Foundation.h>
#import "ERNObservable.h"

@protocol ERNToggler <ERNObservable>
@property (nonatomic) NSUInteger selectedIndex;
@end
