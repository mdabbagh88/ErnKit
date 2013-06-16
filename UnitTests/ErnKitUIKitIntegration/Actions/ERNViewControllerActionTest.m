#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewControllerActionTest.h"
#import "ERNViewControllerAction.h"
#import "ERNViewControllerTransitioner.h"
#import "ERNViewControllerConfigurator.h"

@implementation ERNViewControllerActionTest

-(void)testActionNilTransitionerNilConfiguratorNilResource
{
    //given
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:nil];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionNilTransitionerNilConfiguratorResource
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:nil];

    //when, then
    [action actionForResource:resource];
}

-(void)testActionTransitionerNilConfiguratorNilResource
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionTransitionerNilConfiguratorResource
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:nil];

    //when, then
    [action actionForResource:resource];
}

-(void)testActionNilTransitionerConfiguratorNilResource
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionNilTransitionerConfiguratorResource
{
    //given
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:nil
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForResource:resource];
}


-(void)testActionTransitionerConfiguratorNilResource
{
    //given
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionTransitionerConfiguratorResource
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    id mockTransitioner = [OCMockObject mockForProtocol:@protocol(ERNViewControllerTransitioner)];
    id mockConfigurator = [OCMockObject mockForProtocol:@protocol(ERNViewControllerConfigurator)];
    [[[mockConfigurator expect] andReturn:mockViewController]
     createViewControllerForResource:resource
     dismisser:mockTransitioner];
    [[mockTransitioner expect] transitionToViewController:mockViewController];
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:mockTransitioner
                                                           configurator:mockConfigurator];

    //when, then
    [action actionForResource:resource];

    //then
    [mockConfigurator verify];
    [mockTransitioner verify];
}

@end
