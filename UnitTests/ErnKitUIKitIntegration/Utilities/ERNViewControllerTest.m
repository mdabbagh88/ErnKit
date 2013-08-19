#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNViewControllerTest.h"
#import "ERNViewController.h"
#import "ERNNullResource.h"
#import "ERNAction.h"

@implementation ERNViewControllerTest {
}

-(void)testViewDidAppearNilResourceNilAppearActionNilDisappearAction
{
    UIViewController *viewController =
    [ERNViewController createWithResource:nil
                             appearAction:nil
                          disappearAction:nil];
    [viewController viewDidAppear:YES];
}

-(void)testViewDidDisappearNilResourceNilAppearActionNilDisappearAction
{
    UIViewController *viewController =
    [ERNViewController createWithResource:nil
                             appearAction:nil
                          disappearAction:nil];
    [viewController viewDidDisappear:YES];
}

-(void)testViewDidAppearResourceNilAppearActionNilDisappearAction
{
    UIViewController *viewController =
    [ERNViewController createWithResource:[ERNNullResource create]
                             appearAction:nil
                          disappearAction:nil];
    [viewController viewDidAppear:YES];
}

-(void)testViewDidDisappearResourceNilAppearActionNilDisappearAction
{
    UIViewController *viewController =
    [ERNViewController createWithResource:[ERNNullResource create]
                             appearAction:nil
                          disappearAction:nil];
    [viewController viewDidDisappear:YES];
}

-(void)testViewDidAppearNilResourceAppearActionNilDisappearAction
{
    id mockAppearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAppearAction expect] actionForResource:OCMOCK_ANY];
    UIViewController *viewController =
    [ERNViewController createWithResource:nil
                             appearAction:mockAppearAction
                          disappearAction:nil];
    [viewController viewDidAppear:YES];
    [mockAppearAction verify];
}

-(void)testViewDidDisappearNilResourceAppearActionNilDisappearAction
{
    id mockAppearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    UIViewController *viewController =
    [ERNViewController createWithResource:nil
                             appearAction:mockAppearAction
                          disappearAction:nil];
    [viewController viewDidDisappear:YES];
    [mockAppearAction verify];
}

-(void)testViewDidAppearResourceAppearActionNilDisappearAction
{
    id mockAppearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockResource = [OCMockObject mockForClass:[ERNResource class]];
    [[mockAppearAction expect] actionForResource:mockResource];
    UIViewController *viewController =
    [ERNViewController createWithResource:mockResource
                             appearAction:mockAppearAction
                          disappearAction:nil];
    [viewController viewDidAppear:YES];
    [mockAppearAction verify];
}

-(void)testViewDidDisappearResourceAppearActionNilDisappearAction
{
    id mockAppearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockResource = [OCMockObject mockForClass:[ERNResource class]];
    UIViewController *viewController =
    [ERNViewController createWithResource:mockResource
                             appearAction:mockAppearAction
                          disappearAction:nil];
    [viewController viewDidDisappear:YES];
    [mockAppearAction verify];
}

-(void)testViewDidAppearNilResourceNilAppearActionDisappearAction
{
    id mockDisappearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    UIViewController *viewController =
    [ERNViewController createWithResource:nil
                             appearAction:nil
                          disappearAction:mockDisappearAction];
    [viewController viewDidAppear:YES];
    [mockDisappearAction verify];
}

-(void)testViewDidDisappearNilResourceNilAppearActionDisappearAction
{
    id mockDisappearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockDisappearAction expect] actionForResource:OCMOCK_ANY];
    UIViewController *viewController =
    [ERNViewController createWithResource:nil
                             appearAction:nil
                          disappearAction:mockDisappearAction];
    [viewController viewDidDisappear:YES];
    [mockDisappearAction verify];
}

-(void)testViewDidAppearResourceNilAppearActionDisappearAction
{
    id mockDisappearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    UIViewController *viewController =
    [ERNViewController createWithResource:[ERNNullResource create]
                             appearAction:nil
                          disappearAction:mockDisappearAction];
    [viewController viewDidAppear:YES];
    [mockDisappearAction verify];
}

-(void)testViewDidDisappearResourceNilAppearActionDisappearAction
{
    id mockDisappearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockDisappearAction expect] actionForResource:OCMOCK_ANY];
    UIViewController *viewController =
    [ERNViewController createWithResource:[ERNNullResource create]
                             appearAction:nil
                          disappearAction:mockDisappearAction];
    [viewController viewDidDisappear:YES];
    [mockDisappearAction verify];
}

-(void)testViewDidAppearNilResourceAppearActionDisappearAction
{
    id mockDisappearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAppearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAppearAction expect] actionForResource:OCMOCK_ANY];
    UIViewController *viewController =
    [ERNViewController createWithResource:nil
                             appearAction:mockAppearAction
                          disappearAction:mockDisappearAction];
    [viewController viewDidAppear:YES];
    [mockDisappearAction verify];
    [mockAppearAction verify];
}

-(void)testViewDidDisappearNilResourceAppearActionDisappearAction
{
    id mockDisappearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAppearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockDisappearAction expect] actionForResource:OCMOCK_ANY];
    UIViewController *viewController =
    [ERNViewController createWithResource:nil
                             appearAction:mockAppearAction
                          disappearAction:mockDisappearAction];
    [viewController viewDidDisappear:YES];
    [mockDisappearAction verify];
    [mockAppearAction verify];
}

-(void)testViewDidAppearResourceAppearActionDisappearAction
{
    id mockDisappearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAppearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockResource = [OCMockObject mockForClass:[ERNResource class]];
    [[mockAppearAction expect] actionForResource:mockResource];
    UIViewController *viewController =
    [ERNViewController createWithResource:mockResource
                             appearAction:mockAppearAction
                          disappearAction:mockDisappearAction];
    [viewController viewDidAppear:YES];
    [mockDisappearAction verify];
    [mockAppearAction verify];
}

-(void)testViewDidDisappearResourceAppearActionDisappearAction
{
    id mockDisappearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAppearAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockResource = [OCMockObject mockForClass:[ERNResource class]];
    [[mockDisappearAction expect] actionForResource:mockResource];
    UIViewController *viewController =
    [ERNViewController createWithResource:mockResource
                             appearAction:mockAppearAction
                          disappearAction:mockDisappearAction];
    [viewController viewDidDisappear:YES];
    [mockDisappearAction verify];
    [mockAppearAction verify];
}

@end
