#import "NSURL+ERNHelper.h"

@implementation NSURL (ERNHelper)

#pragma mark - public - constructors

+(instancetype)nullURL
{
    static NSURL *nullURL;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        nullURL = [self URLWithString:@""];
    });
    return nullURL;
}

@end
