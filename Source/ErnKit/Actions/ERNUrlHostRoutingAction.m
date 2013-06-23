#import "ERNUrlHostRoutingAction.h"
#import "ERNErrorHandler.h"

@implementation ERNUrlHostRoutingAction {
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    ERNCheckNilNoReturn(resource);
    [[self validActionForRouting:[[resource url] host]] actionForResource:resource];
}

@end
