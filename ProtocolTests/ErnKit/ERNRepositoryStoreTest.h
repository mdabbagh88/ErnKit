#import <Foundation/Foundation.h>

@protocol ERNRepositoryStore;

@interface ERNRepositoryStoreTest : NSObject
+(void)testRepositoryStore:(id<ERNRepositoryStore>)repositoryStore;
@end