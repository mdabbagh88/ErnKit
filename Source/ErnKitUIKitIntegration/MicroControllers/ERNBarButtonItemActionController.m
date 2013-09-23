#import <UIKit/UIKit.h>
#import "ERNBarButtonItemActionController.h"
#import "ERNErrorHandler.h"
#import "ERNAction.h"
#import "ERNNullAction.h"
#import "ERNNullResource.h"
#import "NSURL+ERNHelper.h"

@interface ERNBarButtonItemActionController ()
@property (nonatomic, readonly) id<ERNAction> action;
@property (nonatomic, readonly) ERNResource *resource;
@end

@implementation ERNBarButtonItemActionController {
    ERNResource *_resource;
    id<ERNAction> _action;
}

#pragma mark - public - constructors

+(instancetype)createWithBarButtonItem:(UIBarButtonItem *)barButtonItem
                                action:(id<ERNAction>)action
                              resource:(ERNResource *)resource
{
    return [[self alloc] initWithBarButtonItem:barButtonItem
                                        action:action
                                      resource:resource];
}

#pragma mark - private

-(void)handleAction
{
    [[self action] actionForResource:[self resource]];
}

#pragma mark - private - accessors

ERNLazyLoadGetter(id<ERNAction>, action, [ERNNullAction create])

ERNLazyLoadGetter(ERNResource *, resource, [ERNNullResource create])

#pragma mark - private - initializer

-(id)initWithBarButtonItem:(UIBarButtonItem *)barButtonItem
                    action:(id<ERNAction>)action
                  resource:(ERNResource *)resource
{
    self = [super init];
    ERNCheckNil(self);
    _action = action;
    _resource = resource;
    [barButtonItem setTarget:self];
    [barButtonItem setAction:@selector(handleAction)];
    return self;
}

@end
