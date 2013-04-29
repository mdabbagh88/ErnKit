#import "NSURL+ERNHelper.h"

@implementation NSURL (ERNHelper)

static id nullURL = nil;

+(instancetype)nullURL
{
    return nullURL ? nullURL : [self URLWithString:@""];
}

@end
