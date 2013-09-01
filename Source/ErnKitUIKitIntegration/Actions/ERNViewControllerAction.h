#import <Foundation/Foundation.h>
#import "ERNAction.h"

@protocol ERNViewControllerFactory;
@protocol ERNViewControllerTransitioner;

@interface ERNViewControllerAction : NSObject <ERNAction>
+(instancetype)createWithTransitioner:(id<ERNViewControllerTransitioner>)transitioner
                         factory:(id<ERNViewControllerFactory>)factory;
@end
