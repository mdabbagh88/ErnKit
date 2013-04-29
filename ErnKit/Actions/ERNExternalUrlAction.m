#import "ERNExternalUrlAction.h"
#import "NSObject+ERNHelper.h"

@interface ERNExternalUrlAction ()
@property (nonatomic, readonly) UIApplication *application;
@end

@implementation ERNExternalUrlAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    ERNCheckNil(url);
    [[self application] openURL:url];
}

-(id)initWithApplication:(UIApplication *)application
{
    self = [self init];
    ERNCheckNil(self);
    _application = application;
    return self;
}

+(instancetype)actionWithApplication:(UIApplication *)application
{
    return [[self alloc] initWithApplication:application];
}

@end
