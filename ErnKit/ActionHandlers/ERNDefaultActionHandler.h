#import <Foundation/Foundation.h>
#import "ERNActionHandler.h"

@protocol ERNAction;
@protocol ERNUrlMimeFactory;

@interface ERNDefaultActionHandler : NSObject <ERNActionHandler>
+(instancetype)actionHandlerWithAction:(id<ERNAction>)action;
+(instancetype)actionHandlerWithAction:(id<ERNAction>)action
                        urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory;
@end
