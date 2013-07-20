#import <MapKit/MapKit.h>

@class ERNDemoTweet;

@interface MKAnnotationView (ERNDemoTwitter)
+(instancetype)createTwitterWithViewReuser:(MKAnnotationView *(^)(NSString *))block
                            fromAnnotation:(ERNDemoTweet *)annotation;
@end
