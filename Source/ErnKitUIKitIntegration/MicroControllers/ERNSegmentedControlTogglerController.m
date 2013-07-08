#import <UIKit/UIKit.h>
#import "ERNSegmentedControlTogglerController.h"
#import "ERNToggler.h"
#import "NSURL+ERNHelper.h"
#import "ERNErrorHandler.h"

@interface ERNSegmentedControlTogglerController ()
@property (nonatomic, readonly) id<ERNToggler> toggler;
@property (nonatomic, readonly) UISegmentedControl *segmentedControl;
@end

@implementation ERNSegmentedControlTogglerController {
}

#pragma mark - public - constructors

+(instancetype)createWithSegmentedControl:(UISegmentedControl *)segmentedControl
                                  toggler:(id<ERNToggler>)toggler
{
    return [[self alloc] initWithSegmentedControl:segmentedControl
                                          toggler:toggler];
}

#pragma mark - private

-(void)valueChanged:(UISegmentedControl *)segmentedControl
{
    [[self toggler] setSelectedIndex:(NSUInteger)[segmentedControl selectedSegmentIndex]];
}

-(void)dataChanged
{
    [[self segmentedControl] setSelectedSegmentIndex:(NSInteger)[[self toggler] selectedIndex]];
}

#pragma mark - private - initializers

-(id)initWithSegmentedControl:(UISegmentedControl *)segmentedControl
                      toggler:(id<ERNToggler>)toggler

{
    self = [super init];
    ERNCheckNil(self);
    _toggler = toggler;
    _segmentedControl = segmentedControl;
    [_toggler addObserver:self
                 selector:@selector(dataChanged)];
    [_segmentedControl addTarget:self
                          action:@selector(valueChanged:)
                forControlEvents:UIControlEventValueChanged];
    return self;
}

@end
