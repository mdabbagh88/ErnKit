#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNBarButtonItemActionControllerTest.h"
#import "ERNBarButtonItemActionController.h"
#import "ERNAction.h"

@interface ERNBarButtonItemActionController ()
-(void)handleAction;
@end

@implementation ERNBarButtonItemActionControllerTest

-(void)testConstructorButtonNilActionNilUrlNilMime
{
    //given
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [[mockButton expect] setTarget:OCMOCK_ANY];
    [[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];

    //when
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:nil
                                                          url:nil
                                                         mime:nil];

    //then
    [mockButton verify];
}

-(void)testHandleActionButtonNilActionNilUrlNilMime
{
    //given
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [[mockButton expect] setTarget:OCMOCK_ANY];
    [[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];
    ERNBarButtonItemActionController *controller =
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:nil
                                                          url:nil
                                                         mime:nil];
    //when
    [controller handleAction];
    
    //then
    [mockButton verify];
}

-(void)testConstructorButtonActionNilUrlNilMime
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [[mockButton expect] setTarget:OCMOCK_ANY];
    [[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];

    //when
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:mockAction
                                                          url:nil
                                                         mime:nil];

    //then
    [mockButton verify];
    [mockAction verify];
}

-(void)testHandleActionButtonActionNilUrlNilMime
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [[mockButton expect] setTarget:OCMOCK_ANY];
    [[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];
    ERNBarButtonItemActionController *controller =
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:mockAction
                                                          url:nil
                                                         mime:nil];
    //when
    [controller handleAction];

    //then
    [mockButton verify];
    [mockAction verify];
}

-(void)testHandleActionButtonActionNilUrlMime
{
    //given
    NSURL *url = [NSURL URLWithString:@"url"];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [[mockButton expect] setTarget:OCMOCK_ANY];
    [[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];
    ERNBarButtonItemActionController *controller =
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:mockAction
                                                          url:url
                                                         mime:nil];
    //when
    [controller handleAction];

    //then
    [mockButton verify];
    [mockAction verify];
}

-(void)testHandleActionButtonActionUrlNilMime
{
    //given
    NSString *mime = @"mime";
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [[mockButton expect] setTarget:OCMOCK_ANY];
    [[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];
    ERNBarButtonItemActionController *controller =
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:mockAction
                                                          url:nil
                                                         mime:mime];
    //when
    [controller handleAction];

    //then
    [mockButton verify];
    [mockAction verify];
}

-(void)testHandleActionButtonActionUrlMime
{
    //given
    NSURL *url = [NSURL URLWithString:@"url"];
    NSString *mime = @"mime";
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForUrl:url
                                 mime:mime];
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [[mockButton expect] setTarget:OCMOCK_ANY];
    [[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];
    ERNBarButtonItemActionController *controller =
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:mockAction
                                                          url:url
                                                         mime:mime];
    //when
    [controller handleAction];

    //then
    [mockButton verify];
    [mockAction verify];
}


-(void)testConstructorNilButtonNilActionNilUrlNilMime
{
    //given, when, then
    [ERNBarButtonItemActionController createWithBarButtonItem:nil
                                                       action:nil
                                                          url:nil
                                                         mime:nil];
}

@end
