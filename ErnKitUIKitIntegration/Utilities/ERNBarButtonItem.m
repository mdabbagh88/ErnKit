#import "ERNBarButtonItem.h"
#import "ERNAction.h"
#import "ERNErrorHandler.h"

@interface ERNBarButtonItem ()
@property (nonatomic, readonly) id<ERNAction> urlAction;
@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) NSString *mime;
@end

@implementation ERNBarButtonItem {
}

#pragma mark - public - constructors

+(instancetype)barButtonItemWithCustomView:(UIView *)view
                                    action:(id<ERNAction>)action
                                       url:(NSURL *)url
                                      mime:(NSString *)mime
{
    return [[self alloc] initWithCustomView:view
                                     action:action
                                        url:url
                                       mime:mime];
}

+(instancetype)barButtonItemWithSystemItem:(UIBarButtonSystemItem)systemItem
                                    action:(id<ERNAction>)action
                                       url:(NSURL *)url
                                      mime:(NSString *)mime
{
    return [[self alloc] initWithSystemItem:systemItem
                                     action:action
                                        url:url
                                       mime:mime];
}

#pragma mark - private

-(void)handleAction
{
    [[self urlAction] actionForUrl:[self url]
                              mime:[self mime]];
}

#pragma mark - private - initializers

-(id)initWithCustomView:(UIView *)view
                 action:(id<ERNAction>)action
                    url:(NSURL *)url
                   mime:(NSString *)mime
{
    self = [self initWithCustomView:view];
    ERNCheckNil(self);
    _urlAction = action;
    _url = url;
    _mime = mime;
    return self;
}

-(id)initWithSystemItem:(UIBarButtonSystemItem)systemItem
                 action:(id<ERNAction>)action
                    url:(NSURL *)url
                   mime:(NSString *)mime

{
    self = [self initWithBarButtonSystemItem:systemItem
                                      target:self
                                      action:@selector(handleAction)];
    ERNCheckNil(self);
    _urlAction = action;
    _url = url;
    _mime = mime;
    return self;
}

@end
