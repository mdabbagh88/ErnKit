#import "ERNMimeRoutingAction.h"
#import "NSObject+ERNHelper.h"
#import "ERNErrorHandler.h"

@implementation ERNMimeRoutingAction {
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    ERNCheckNilNoReturn(resource);
    [[self validActionForRouting:[resource mime]] actionForResource:resource];
}

@end
