#import <Foundation/Foundation.h>

@protocol ERNActionHandler <NSObject>
-(void)actionForObject:(id<NSObject>)object;
@end
