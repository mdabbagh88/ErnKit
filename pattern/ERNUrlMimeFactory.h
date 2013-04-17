#import <Foundation/Foundation.h>

@protocol ERNUrlMimeFactory <NSObject>
-(NSURL *)urlForObject:(id<NSObject>)object;
-(NSString *)mimeForObject:(id<NSObject>)object;
@end
