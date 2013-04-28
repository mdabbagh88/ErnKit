#import <Foundation/Foundation.h>
#import "ERNViewControllerConfigurator.h"

@protocol ERNActionHandler;
@protocol ERNAsyncItemsRepository;

@interface ERNDemoFourthScreenConfigurator : NSObject <ERNViewControllerConfigurator>
@property (nonatomic, readwrite) id<ERNActionHandler> actionHandler;
+(instancetype)configuratorWithRepository:(id<ERNAsyncItemsRepository>)repository;
@end
