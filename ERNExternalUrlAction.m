#import <UIKit/UIKit.h>
#import "ERNExternalUrlAction.h"

@interface ERNExternalUrlAction ()
@property (nonatomic, readonly) UIApplication *application;
@end

@implementation ERNExternalUrlAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    [[self application] openURL:url];
}

-(id)initWithApplication:(UIApplication *)application
{
    self = [super init];
    _application = application;
    return self;
}

+(instancetype)actionWithApplication:(UIApplication *)application
{
    return [[self alloc] initWithApplication:application];
}

@end
