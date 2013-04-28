#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ERNDemoTweet : NSObject <MKAnnotation>
@property (nonatomic, copy) NSNumber *statusID;
@property (nonatomic, copy) NSDate *createdAt;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, copy) NSString *inReplyToScreenName;
@property (nonatomic, copy) NSNumber *isFavorited;
@property (nonatomic, copy) NSArray *coordinates;
@end
