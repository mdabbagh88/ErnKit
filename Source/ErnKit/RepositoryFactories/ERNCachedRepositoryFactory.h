#import <Foundation/Foundation.h>
#import "ERNRepositoryFactory.h"

@interface ERNCachedRepositoryFactory : NSObject <ERNRepositoryFactory>
+(instancetype)createWithFirst:(id<ERNRepositoryFactory>)firstRepositoryFactory
                          rest:(id<ERNRepositoryFactory>)restRepositoryFactory;
@end
