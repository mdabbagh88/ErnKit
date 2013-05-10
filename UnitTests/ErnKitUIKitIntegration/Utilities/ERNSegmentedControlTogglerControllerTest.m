#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNSegmentedControlTogglerControllerTest.h"
#import "ERNSegmentedControlTogglerController.h"
#import "ERNToggler.h"

@interface ERNSegmentedControlTogglerController ()
-(void)valueChanged:(UISegmentedControl *)segmentedControl;
@end

@implementation ERNSegmentedControlTogglerControllerTest

-(void)testConstructorNilSegmentedControlNilToggler
{
    //given, when, then
    [ERNSegmentedControlTogglerController createWithSegmentedControl:nil
                                                             toggler:nil];
}

-(void)testConstructorSegmentedControlNilToggler
{
    //given
    id mockSegmentedControl = [OCMockObject mockForClass:[UISegmentedControl class]];
    [[mockSegmentedControl expect] addTarget:OCMOCK_ANY
                                      action:NSSelectorFromString(@"valueChanged:")
                            forControlEvents:UIControlEventValueChanged];

    //when
    [ERNSegmentedControlTogglerController createWithSegmentedControl:mockSegmentedControl
                                                             toggler:nil];

    //then
    [mockSegmentedControl verify];
}

-(void)testTogglerSegmentedControlNilToggler
{
    //given
    NSInteger expectedIndex = 2;
    id mockSegmentedControl = [OCMockObject mockForClass:[UISegmentedControl class]];
    [[mockSegmentedControl expect] addTarget:OCMOCK_ANY
                                      action:NSSelectorFromString(@"valueChanged:")
                            forControlEvents:UIControlEventValueChanged];
    [[[mockSegmentedControl expect]
      andReturnValue:OCMOCK_VALUE(expectedIndex)] selectedSegmentIndex];
    ERNSegmentedControlTogglerController * controller =
    [ERNSegmentedControlTogglerController createWithSegmentedControl:mockSegmentedControl
                                                             toggler:nil];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
}

-(void)testTogglerSegmentedControlToggler
{
    //given
    NSInteger expectedIndex = 2;
    id mockToggler = [OCMockObject mockForProtocol:@protocol(ERNToggler)];
    [[mockToggler expect] toggleToIndex:(NSUInteger)expectedIndex];
    id mockSegmentedControl = [OCMockObject mockForClass:[UISegmentedControl class]];
    [[mockSegmentedControl expect] addTarget:OCMOCK_ANY
                                      action:NSSelectorFromString(@"valueChanged:")
                            forControlEvents:UIControlEventValueChanged];
    [[[mockSegmentedControl expect]
      andReturnValue:OCMOCK_VALUE(expectedIndex)] selectedSegmentIndex];
    ERNSegmentedControlTogglerController * controller =
    [ERNSegmentedControlTogglerController createWithSegmentedControl:mockSegmentedControl
                                                             toggler:mockToggler];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
}

@end
