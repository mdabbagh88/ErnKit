#import <Foundation/Foundation.h>

@protocol ERNRepositoryFactory;

@interface ERNRepositoryFactoryTest : NSObject
+(void)testRepositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory;
@end
