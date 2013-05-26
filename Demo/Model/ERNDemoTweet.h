#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ERNDemoTweet : NSObject <MKAnnotation>
@property (nonatomic, readonly) NSURL *imageUrl;
@end
