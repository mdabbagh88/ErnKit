#import <Foundation/Foundation.h>
#import <ErnKit/ErnKit.h>
#import <ErnKit/MapKitIntegration.h>

@interface ERNDemoTweetMapViewAnnotationViewFactory : NSObject <ERNMapViewAnnotationViewFactory>
+(instancetype)create;
@end
