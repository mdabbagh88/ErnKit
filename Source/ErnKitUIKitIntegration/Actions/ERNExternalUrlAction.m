#import <UIKit/UIKit.h>
#import "ERNExternalUrlAction.h"
#import "ERNErrorHandler.h"

@interface ERNExternalUrlAction ()
@property (nonatomic, readonly) UIApplication *application;
@end

@implementation ERNExternalUrlAction {
}

#pragma mark - public - constructors

+(instancetype)createWithApplication:(UIApplication *)application
{
    return [[self alloc] initWithApplication:application];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    ERNCheckNilNoReturn(resource);
    [[self application] openURL:[resource url]];
}

#pragma mark - private - initializers

-(id)initWithApplication:(UIApplication *)application
{
    self = [super init];
    ERNCheckNil(self);
    _application = application;
    return self;
}

@end
