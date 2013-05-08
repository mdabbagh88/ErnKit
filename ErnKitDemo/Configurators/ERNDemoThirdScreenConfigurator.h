#import <Foundation/Foundation.h>
#import "ERNViewControllerConfigurator.h"

@protocol ERNActionHandler;

@interface ERNDemoThirdScreenConfigurator : NSObject <ERNViewControllerConfigurator>
@property (nonatomic, weak) id<ERNActionHandler> actionHandler;
+(instancetype)configurator;
@end
