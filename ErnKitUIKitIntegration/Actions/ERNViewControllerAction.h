#import <Foundation/Foundation.h>
#import "ERNAction.h"

@protocol ERNViewControllerConfigurator;
@protocol ERNViewControllerTransitioner;

@interface ERNViewControllerAction : NSObject <ERNAction>
+(instancetype)actionWithTransitioner:(id<ERNViewControllerTransitioner>)transitioner
                         configurator:(id<ERNViewControllerConfigurator>)configurator;
@end
