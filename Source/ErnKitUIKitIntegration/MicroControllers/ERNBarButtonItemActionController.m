#import <UIKit/UIKit.h>
#import "ERNBarButtonItemActionController.h"
#import "ERNErrorHandler.h"
#import "ERNAction.h"
#import "NSURL+ERNHelper.h"

@interface ERNBarButtonItemActionController ()
@property (nonatomic, readonly) id<ERNAction> action;
@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly, copy) NSString *mime;
@end

@implementation ERNBarButtonItemActionController {
    NSURL *_url;
    NSString *_mime;
}

#pragma mark - public - constructors

+(instancetype)createWithBarButtonItem:(UIBarButtonItem *)barButtonItem
                                action:(id<ERNAction>)action
                                   url:(NSURL *)url
                                  mime:(NSString *)mime
{
    return [[self alloc] initWithBarButtonItem:barButtonItem
                                        action:action
                                           url:url
                                          mime:mime];
}

#pragma mark - private

-(void)handleAction
{
    ERNCheckNilNoReturn([self url]);
    ERNCheckNilNoReturn([self mime]);
    [[self action] actionForUrl:[self url]
                           mime:[self mime]];
}

#pragma mark - private - initializer

-(id)initWithBarButtonItem:(UIBarButtonItem *)barButtonItem
                    action:(id<ERNAction>)action
                    url:(NSURL *)url
                   mime:(NSString *)mime
{
    self = [self init];
    ERNCheckNil(self);
    _action = action;
    _mime = mime;
    _url = url;
    [barButtonItem setTarget:self];
    [barButtonItem setAction:@selector(handleAction)];
    return self;
}

@end
