#import <Foundation/Foundation.h>
#import "ERNActionHandler.h"

@protocol ERNAction;
@protocol ERNUrlMimeFactory;
@protocol ERNRepositoryStore;

@interface ERNDefaultActionHandler : NSObject <ERNActionHandler>
+(instancetype)createWithAction:(id<ERNAction>)action;
+(instancetype)createWithAction:(id<ERNAction>)action
                 urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory;
+(instancetype)createWithAction:(id<ERNAction>)action
                 urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory
                repositoryStore:(id<ERNRepositoryStore>)repositoryStore;
@end
