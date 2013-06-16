#import <Foundation/Foundation.h>

@protocol ERNResourceFactory <NSObject>
-(NSURL *)urlForObject:(id<NSObject>)object;
-(NSString *)mimeForObject:(id<NSObject>)object;
@end
