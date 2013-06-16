#import <Foundation/Foundation.h>
#import <ErnKit/ErnKit.h>
#import <ErnKit/UIKitIntegration.h>

@interface ERNDemoApplicationConfigurator : NSObject <ERNViewControllerConfigurator>
+(instancetype)create;
@end
