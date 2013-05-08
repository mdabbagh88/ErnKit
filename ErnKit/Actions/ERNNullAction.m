#import "ERNNullAction.h"

static ERNNullAction *immutableSingleton;

@implementation ERNNullAction {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
