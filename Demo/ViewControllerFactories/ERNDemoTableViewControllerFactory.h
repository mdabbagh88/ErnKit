#import <Foundation/Foundation.h>
#import <ErnKit/ErnKit.h>
#import <ErnKit/UIKitIntegration.h>

@interface ERNDemoTableViewControllerFactory : NSObject <ERNViewControllerFactory>
+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                            toggler:(id<ERNToggler>)toggler;
@end
