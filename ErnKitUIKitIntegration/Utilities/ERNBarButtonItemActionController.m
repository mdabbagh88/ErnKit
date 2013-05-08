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

#pragma mark - public - constructor

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
    [[self action] actionForUrl:[self url]
                           mime:[self mime]];
}

#pragma mark - private - accessors

-(NSURL *)url
{
    return _url = _url ? _url : [NSURL createNull];
}

-(NSString *)mime
{
    return _mime = _mime ? _mime : @"";
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
    [barButtonItem setTarget:self];
    [barButtonItem setAction:@selector(handleAction)];
    return self;
}

@end
