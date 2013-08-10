#import "ERNViewController.h"
#import "ERNErrorHandler.h"
#import "ERNNullAction.h"
#import "ERNNullResource.h"

@interface ERNViewController ()
@property (nonatomic, readonly) id<ERNAction> appearAction;
@property (nonatomic, readonly) id<ERNAction> disappearAction;
@property (nonatomic, readonly) ERNResource *resource;
@end

@implementation ERNViewController {
    id<ERNAction> _appearAction;
    id<ERNAction> _disappearAction;
    ERNResource *_resource;
}

#pragma mark - public - constructors

+(instancetype)createWithResource:(ERNResource *)resource
                     appearAction:(id<ERNAction>)appearAction
                  disappearAction:(id<ERNAction>)disappearAction
{
    return [[self alloc] initWithResource:resource
                             appearAction:appearAction
                          disappearAction:disappearAction];
}

#pragma mark - UIViewController

-(void)viewDidAppear:(BOOL)__unused animated
{
    [[self appearAction] actionForResource:[self resource]];
}

-(void)viewDidDisappear:(BOOL)__unused animated
{
    [[self disappearAction] actionForResource:[self resource]];
}

#pragma mark - private - accessors

-(id<ERNAction>)appearAction
{
    return _appearAction = _appearAction ? _appearAction : [ERNNullAction create];
}

-(id<ERNAction>)disappearAction
{
    return _disappearAction = _disappearAction ? _disappearAction : [ERNNullAction create];
}

-(ERNResource *)resource
{
    return _resource = _resource ? _resource : [ERNNullResource create];
}

#pragma mark - private - initializers

-(id)initWithResource:(ERNResource *)resource
                        appearAction:(id<ERNAction>)appearAction
                        disappearAction:(id<ERNAction>)disappearAction
{
    self = [super init];
    ERNCheckNil(self);
    _appearAction = appearAction;
    _disappearAction = disappearAction;
    _resource = resource;
    return self;
}

@end
