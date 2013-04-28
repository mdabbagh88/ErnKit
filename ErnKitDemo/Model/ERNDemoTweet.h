#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ERNDemoTweet : NSObject <MKAnnotation>
@property (nonatomic, readonly, copy) NSString *text;
@property (nonatomic, readonly, copy) NSArray *coordinates;
@property (nonatomic, readonly) NSURL *imageUrl;
@end
