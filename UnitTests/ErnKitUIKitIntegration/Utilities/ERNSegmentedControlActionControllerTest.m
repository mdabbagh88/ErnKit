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

-(void)testConstructorNilSegmentedControlNilActionNilUrlNilMime
{
    //given, when, then
    [ERNSegmentedControlActionController createWithSegmentedControl:nil
                                                             actions:nil
                                                                url:nil
                                                               mime:nil];
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
                                                                url:nil
                                                               mime:nil];

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
                                                                url:nil
                                                               mime:nil];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
}

-(void)testTogglerSegmentedControlTogglerOutOfBoundsNilUrlMime
{
    //given
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
                                                                url:nil
                                                               mime:@"mime"];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testTogglerSegmentedControlTogglerNilUrlMime
{
    //given
    NSInteger expectedIndex = 1;
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
                                                                url:nil
                                                               mime:@"mime"];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testTogglerSegmentedControlTogglerOutOfBoundsUrlNilMime
{
    //given
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
                                                                url:[NSURL URLWithString:@"url"]
                                                               mime:nil];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testTogglerSegmentedControlTogglerUrlNilMime
{
    //given
    NSInteger expectedIndex = 1;
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
                                                                url:[NSURL URLWithString:@"url"]
                                                               mime:nil];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testTogglerSegmentedControlTogglerOutOfBoundsUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
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
                                                                url:expectedUrl
                                                               mime:expectedMime];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testTogglerSegmentedControlTogglerUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    NSInteger expectedIndex = 1;
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction2 expect] actionForUrl:expectedUrl
                                  mime:expectedMime];
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
                                                                url:expectedUrl
                                                               mime:expectedMime];

    //when
    [controller valueChanged:mockSegmentedControl];

    //then
    [mockSegmentedControl verify];
    [mockAction1 verify];
    [mockAction2 verify];
}

@end
