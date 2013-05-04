#import <UIKit/UIKit.h>
#import "ERNExternalUrlAction.h"
#import "ERNErrorHandler.h"

@interface ERNExternalUrlAction ()
@property (nonatomic, readonly) UIApplication *application;
@end

@implementation ERNExternalUrlAction {
}

#pragma mark - public - constructors

+(instancetype)actionWithApplication:(UIApplication *)application
{
    return [[self alloc] initWithApplication:application];
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    ERNCheckNilNoReturn(url);
    [[self application] openURL:url];
}

#pragma mark - private - initializers

-(id)initWithApplication:(UIApplication *)application
{
    self = [self init];
    ERNCheckNil(self);
    _application = application;
    return self;
}

@end
