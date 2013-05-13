#import <Foundation/Foundation.h>
#import "ERNViewControllerConfigurator.h"

@protocol ERNAsyncItemsRepository;
@protocol ERNToggler;

@interface ERNDemoTableViewControllerConfigurator : NSObject <ERNViewControllerConfigurator>
+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                            toggler:(id<ERNToggler>)toggler;
@end
