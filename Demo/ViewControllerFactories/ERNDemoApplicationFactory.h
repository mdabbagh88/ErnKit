#import <Foundation/Foundation.h>
#import <ErnKit/ErnKit.h>
#import <ErnKit/UIKitIntegration.h>

@interface ERNDemoApplicationFactory : NSObject <ERNViewControllerFactory>
+(instancetype)create;
@end
