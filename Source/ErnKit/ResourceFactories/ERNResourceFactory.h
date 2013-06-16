#import <Foundation/Foundation.h>

@class ERNResource;

@protocol ERNResourceFactory <NSObject>
-(ERNResource *)resourceForObject:(id<NSObject>)object;
@end
