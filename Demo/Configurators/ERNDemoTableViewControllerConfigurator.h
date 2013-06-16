#import <Foundation/Foundation.h>
#import <ErnKit/ErnKit.h>
#import <ErnKit/UIKitIntegration.h>

@interface ERNDemoTableViewControllerConfigurator : NSObject <ERNViewControllerConfigurator>
+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                            toggler:(id<ERNToggler>)toggler;
@end
