#import <Foundation/Foundation.h>
#import "ERNViewControllerConfigurator.h"

@protocol ERNActionHandler;

@interface ERNDemoThirdScreenConfigurator : NSObject <ERNViewControllerConfigurator>
@property (nonatomic, readwrite) id<ERNActionHandler> actionHandler;
+(instancetype)configurator;
@end
