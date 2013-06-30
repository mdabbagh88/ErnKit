#import <Foundation/Foundation.h>
#import "ERNObservable.h"

@protocol ERNBinaryToggle <ERNObservable>
@property (nonatomic, assign) BOOL selected;
@end
