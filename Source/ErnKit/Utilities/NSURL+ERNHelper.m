#import "NSURL+ERNHelper.h"
#import "ERNErrorHandler.h"

@implementation NSURL (ERNHelper)

#pragma mark - public - constructors

+(instancetype)ERN_createNull
{
    return ERNLazyLoadSingletonWithLoader([NSURL URLWithString:@""]);
}

-(BOOL)ERN_hasValue
{
    return ![[self absoluteString] isEqualToString:[[[self class] ERN_createNull] absoluteString]];
}

@end
