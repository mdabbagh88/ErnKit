#import <Foundation/Foundation.h>
#import "ERNObjectAction.h"

@protocol ERNAction;
@protocol ERNResourceFactory;
@protocol ERNRepositoryStore;

@interface ERNStoreResourceObjectAction : NSObject <ERNObjectAction>
+(instancetype)createWithResourceFactory:(id<ERNResourceFactory>)resourceFactory
                         repositoryStore:(id<ERNRepositoryStore>)repositoryStore;
@end
