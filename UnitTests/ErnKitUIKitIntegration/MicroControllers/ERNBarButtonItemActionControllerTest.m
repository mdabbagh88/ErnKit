#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNBarButtonItemActionControllerTest.h"
#import "ERNBarButtonItemActionController.h"
#import "ERNNullResource.h"
#import "ERNAction.h"

@interface ERNBarButtonItemActionController ()
-(void)handleAction;
@end

@implementation ERNBarButtonItemActionControllerTest

-(void)testConstructorButtonNilActionNilResource
{
    //given
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [(UIBarButtonItem *)[mockButton expect] setTarget:OCMOCK_ANY];
    [(UIBarButtonItem *)[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];
    
    //when
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:nil
                                                     resource:nil];
    
    //then
    [mockButton verify];
}

-(void)testHandleActionButtonNilActionNilResource
{
    //given
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [(UIBarButtonItem *)[mockButton expect] setTarget:OCMOCK_ANY];
    [(UIBarButtonItem *)[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];
    ERNBarButtonItemActionController *controller =
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:nil
                                                     resource:nil];
    
    //when
    [controller handleAction];
    
    //then
    [mockButton verify];
}

-(void)testConstructorButtonActionNilResource
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [(UIBarButtonItem *)[mockButton expect] setTarget:OCMOCK_ANY];
    [(UIBarButtonItem *)[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];
    
    //when
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:mockAction
                                                     resource:nil];
    
    //then
    [mockButton verify];
    [mockAction verify];
}

-(void)testHandleActionButtonActionNilResource
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [(UIBarButtonItem *)[mockButton expect] setTarget:OCMOCK_ANY];
    [(UIBarButtonItem *)[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];
    [[mockAction expect] actionForResource:[ERNNullResource create]];
    ERNBarButtonItemActionController *controller =
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:mockAction
                                                     resource:nil];
    
    //when
    [controller handleAction];
    
    //then
    [mockButton verify];
    [mockAction verify];
}

-(void)testHandleActionButtonActionResource
{
    //given
    NSURL *url = [NSURL URLWithString:@"url"];
    NSString *mime = @"mime";
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    ERNResource *resource = [ERNResource createWithUrl:url
                                                  mime:mime];
    [[mockAction expect] actionForResource:resource];
    id mockButton = [OCMockObject mockForClass:[UIBarButtonItem class]];
    [(UIBarButtonItem *)[mockButton expect] setTarget:OCMOCK_ANY];
    [(UIBarButtonItem *)[mockButton expect] setAction:NSSelectorFromString(@"handleAction")];
    ERNBarButtonItemActionController *controller =
    [ERNBarButtonItemActionController createWithBarButtonItem:mockButton
                                                       action:mockAction
                                                     resource:resource];
    //when
    [controller handleAction];
    
    //then
    [mockButton verify];
    [mockAction verify];
}


-(void)testConstructorNilButtonNilActionNilResource
{
    //given, when, then
    [ERNBarButtonItemActionController createWithBarButtonItem:nil
                                                       action:nil
                                                     resource:nil];
}

@end
