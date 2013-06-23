#import "ERNUrlSchemeRoutingAction.h"
#import "ERNErrorHandler.h"

@implementation ERNUrlSchemeRoutingAction {
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    ERNCheckNilNoReturn(resource);
    [[self validActionForRouting:[[resource url] scheme]] actionForResource:resource];
}

@end
