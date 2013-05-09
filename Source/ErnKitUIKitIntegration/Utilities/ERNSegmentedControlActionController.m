#import <UIKit/UIKit.h>
#import "ERNSegmentedControlActionController.h"
#import "ERNErrorHandler.h"
#import "ERNAction.h"
#import "ERNNullAction.h"
#import "NSURL+ERNHelper.h"
#import "NSObject+ERNHelper.h"

@interface ERNSegmentedControlActionController ()
@property (nonatomic, readonly, copy) NSArray *actions;
@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly, copy) NSString *mime;
@end

@implementation ERNSegmentedControlActionController {
    NSArray *_actions;
    NSURL *_url;
    NSString *_mime;
}

#pragma mark - public - constructors

+(instancetype)createWithSegmentedControl:(UISegmentedControl *)segmentedControl
                                  actions:(NSArray *)actions
                                      url:(NSURL *)url
                                     mime:(NSString *)mime
{
    return [[self alloc] initWithSegmentedControl:segmentedControl
                                          actions:actions
                                              url:url
                                             mime:mime];
}

#pragma mark - private

-(void)valueChanged:(UISegmentedControl *)segmentedControl
{
    [self handleChangedIndex:(NSUInteger)[segmentedControl selectedSegmentIndex]];
}

-(void)handleChangedIndex:(NSUInteger)index
{
    [self handleAction:[self validActionForIndex:index]];
}

-(id<ERNAction>)validActionForIndex:(NSUInteger)index
{
    return [self validIndex:index] ? [self actions][index] : [ERNNullAction create];
}

-(BOOL)validIndex:(NSUInteger)index
{
    return index < [[self actions] count] &&
    [[self actions][index] conformsToProtocol:@protocol(ERNAction)];
}

-(void)handleAction:(id<ERNAction>)action
{
    [action actionForUrl:[self url]
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

-(NSArray *)actions
{
    return _actions = _actions ? _actions : @[];
}

#pragma mark - private - initializers

-(id)initWithSegmentedControl:(UISegmentedControl *)segmentedControl
                      actions:(NSArray *)actions
                          url:(NSURL *)url
                         mime:(NSString *)mime

{
    self = [self init];
    ERNCheckNil(self);
    _actions = actions;
    _url = url;
    _mime = mime;
    [segmentedControl addTarget:self
                         action:@selector(valueChanged:)
               forControlEvents:UIControlEventValueChanged];
    return self;
}

@end
