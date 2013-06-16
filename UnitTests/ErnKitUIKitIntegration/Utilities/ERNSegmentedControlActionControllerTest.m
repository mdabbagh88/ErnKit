#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNSegmentedControlActionControllerTest.h"
#import "ERNSegmentedControlActionController.h"
#import "ERNAction.h"

@interface ERNSegmentedControlActionController ()
-(void)valueChanged:(UISegmentedControl *)segmentedControl;
@end

@implementation ERNSegmentedControlActionControllerTest

-(void)testConstructorNilSegmentedControlNilActionNilResource
{
    //given, when, then
    [ERNSegmentedControlActionController createWithSegmentedControl:nil
                                                             actions:nil
                                                           resource:nil];
}

-(void)testConstructorSegmentedControl
{
    //given
    id mockSegmentedControl = [OCMockObject mockForClass:[UISegmentedControl class]];
    [[mockSegmentedControl expect] addTarget:OCMOCK_ANY
                                      action:NSSelectorFromString(@"valueChanged:")
                            forControlEvents:UIControlEventValueChanged];

    //when
    [ERNSegmentedControlActionController createWithSegmentedControl:mockSegmentedControl
                                                            actions:nil
                                                           resource:nil];

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
    ERNSegmentedControlActionController * controller =
    [ERNSegmentedControlActionController createWithSegmentedControl:mockSegmentedControl
                                                            actions:nil
                                                           resource:nil];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
}

-(void)testTogglerSegmentedControlTogglerOutOfBoundsResource
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    NSInteger expectedIndex = 2;
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSArray *actions = @[mockAction1, mockAction2];
    id mockSegmentedControl = [OCMockObject mockForClass:[UISegmentedControl class]];
    [[mockSegmentedControl expect] addTarget:OCMOCK_ANY
                                      action:NSSelectorFromString(@"valueChanged:")
                            forControlEvents:UIControlEventValueChanged];
    [[[mockSegmentedControl expect]
      andReturnValue:OCMOCK_VALUE(expectedIndex)] selectedSegmentIndex];
    ERNSegmentedControlActionController * controller =
    [ERNSegmentedControlActionController createWithSegmentedControl:mockSegmentedControl
                                                            actions:actions
                                                           resource:resource];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testTogglerSegmentedControlTogglerResource
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    NSInteger expectedIndex = 1;
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction2 expect] actionForResource:resource];
    NSArray *actions = @[mockAction1, mockAction2];
    id mockSegmentedControl = [OCMockObject mockForClass:[UISegmentedControl class]];
    [[mockSegmentedControl expect] addTarget:OCMOCK_ANY
                                      action:NSSelectorFromString(@"valueChanged:")
                            forControlEvents:UIControlEventValueChanged];
    [[[mockSegmentedControl expect]
      andReturnValue:OCMOCK_VALUE(expectedIndex)] selectedSegmentIndex];
    ERNSegmentedControlActionController * controller =
    [ERNSegmentedControlActionController createWithSegmentedControl:mockSegmentedControl
                                                            actions:actions
                                                           resource:resource];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
    [mockAction1 verify];
    [mockAction2 verify];
}

@end
