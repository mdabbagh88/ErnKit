#import <UIKit/UIKit.h>
#import "ERNSegmentedControlActionController.h"
#import "ERNErrorHandler.h"
#import "ERNAction.h"
#import "ERNNullAction.h"
#import "ERNResource.h"
#import "NSURL+ERNHelper.h"
#import "NSObject+ERNHelper.h"

@interface ERNSegmentedControlActionController ()
@property (nonatomic, readonly, copy) NSArray *actions;
@property (nonatomic, readonly) ERNResource *resource;
@end

@implementation ERNSegmentedControlActionController {
    NSArray *_actions;
    ERNResource *_resource;
}

#pragma mark - public - constructors

+(instancetype)createWithSegmentedControl:(UISegmentedControl *)segmentedControl
                                  actions:(NSArray *)actions
                                 resource:(ERNResource *)resource
{
    return [[self alloc] initWithSegmentedControl:segmentedControl
                                          actions:actions
                                         resource:resource];
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
    ERNCheckNilNoReturn([self resource]);
    [action actionForResource:[self resource]];
}

#pragma mark - private - accessors

-(NSArray *)actions
{
    return _actions = _actions ? _actions : @[];
}

#pragma mark - private - initializers

-(id)initWithSegmentedControl:(UISegmentedControl *)segmentedControl
                      actions:(NSArray *)actions
                     resource:(ERNResource *)resource
{
    self = [self init];
    ERNCheckNil(self);
    _actions = actions;
    _resource = resource;
    [segmentedControl addTarget:self
                         action:@selector(valueChanged:)
               forControlEvents:UIControlEventValueChanged];
    return self;
}

@end
