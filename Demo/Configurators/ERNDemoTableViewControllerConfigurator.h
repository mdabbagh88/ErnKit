#import <Foundation/Foundation.h>
#import <ErnKit/ERNViewControllerConfigurator.h>

@protocol ERNAsyncPaginatedItemsRepository;
@protocol ERNToggler;

@interface ERNDemoTableViewControllerConfigurator : NSObject <ERNViewControllerConfigurator>
+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                            toggler:(id<ERNToggler>)toggler;
@end
