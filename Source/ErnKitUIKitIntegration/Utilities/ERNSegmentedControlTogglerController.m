#import <UIKit/UIKit.h>
#import "ERNSegmentedControlTogglerController.h"
#import "ERNToggler.h"
#import "NSURL+ERNHelper.h"
#import "ERNErrorHandler.h"

@interface ERNSegmentedControlTogglerController ()
@property (nonatomic, readonly) id<ERNToggler> toggler;
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
    [[self toggler] toggleToIndex:(NSUInteger)[segmentedControl selectedSegmentIndex]];
}

#pragma mark - private - initializers

-(id)initWithSegmentedControl:(UISegmentedControl *)segmentedControl
                      toggler:(id<ERNToggler>)toggler

{
    self = [self init];
    ERNCheckNil(self);
    _toggler = toggler;
    [segmentedControl addTarget:self
                         action:@selector(valueChanged:)
               forControlEvents:UIControlEventValueChanged];
    return self;
}

@end
