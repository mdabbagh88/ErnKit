#import <Foundation/Foundation.h>
#import "ERNViewControllerConfigurator.h"

@protocol ERNActionHandler;
@protocol ERNAsyncItemsRepository;

@interface ERNDemoFirstScreenConfigurator : NSObject <ERNViewControllerConfigurator>
+(instancetype)configuratorWithItemActionHandler:(id<ERNActionHandler>)actionHandler
                                      repository:(id<ERNAsyncItemsRepository>)repository;
@end
