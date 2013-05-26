#import <Foundation/Foundation.h>
#import <ErnKit/ERNViewControllerConfigurator.h>

@protocol ERNAsyncPaginatedItemsRepository;
@protocol ERNToggler;

@interface ERNDemoMapViewControllerConfigurator : NSObject <ERNViewControllerConfigurator>
+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                            toggler:(id<ERNToggler>)toggler;
@end
