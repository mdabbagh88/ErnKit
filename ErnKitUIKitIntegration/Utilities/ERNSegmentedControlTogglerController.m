#import <UIKit/UIKit.h>
#import "ERNSegmentedControlTogglerController.h"
#import "ERNToggler.h"
#import "NSURL+ERNHelper.h"
#import "ERNErrorHandler.h"

@interface ERNSegmentedControlTogglerController ()
@property (nonatomic, readonly) id<ERNToggler> toggler;
@end

@implementation ERNSegmentedControlTogglerController {
    NSURL *_url;
    NSString *_mime;
}

#pragma mark - public - constructors

+(instancetype)createWithSegmentedControl:(UISegmentedControl *)segmentedControl
                                  toggler:(id<ERNToggler>)toggler
                                      url:(NSURL *)url
                                     mime:(NSString *)mime
{
    return [[self alloc] initWithSegmentedControl:segmentedControl
                                          toggler:toggler
                                              url:url
                                             mime:mime];
}

#pragma mark - private

-(void)valueChanged:(UISegmentedControl *)segmentedControl
{
    [[self toggler] toggleToIndex:(NSUInteger)[segmentedControl selectedSegmentIndex]];
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

#pragma mark - private - initializers

-(id)initWithSegmentedControl:(UISegmentedControl *)segmentedControl
                      toggler:(id<ERNToggler>)toggler
                          url:(NSURL *)url
                         mime:(NSString *)mime

{
    self = [self init];
    ERNCheckNil(self);
    _toggler = toggler;
    _url = url;
    _mime = mime;
    [segmentedControl addTarget:self
                         action:@selector(valueChanged:)
               forControlEvents:UIControlEventValueChanged];
    return self;
}

@end
