#import "ERNDemoTweetMapViewAnnotationViewFactory.h"
#import "MKAnnotationView+ERNDemoTwitter.h"

// An ERNMapViewAnnotationViewFactory, creating MKAnnotationViews based on ERNDemoTweet objects

@implementation ERNDemoTweetMapViewAnnotationViewFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNMapViewAnnotationViewFactory

-(MKAnnotationView *)annotationViewWithViewReuser:(MKAnnotationView *(^)(NSString *))block
                                   fromAnnotation:(id<MKAnnotation>)annotation
{
    return [MKAnnotationView createTwitterWithViewReuser:(MKAnnotationView *(^)(NSString *))block
                                          fromAnnotation:(ERNDemoTweet *)annotation];
}

@end
