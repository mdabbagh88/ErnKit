#import "ERNNullAction.h"

static ERNNullAction *action;

@implementation ERNNullAction {
}

#pragma mark - public - constructors

+(instancetype)action
{
    return action;
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
}

#pragma mark - NSObject

+(void)initialize
{
    action = [self new];
}

@end
