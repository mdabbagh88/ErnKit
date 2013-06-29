#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullActionHandlerTest.h"
#import "ERNNullActionHandler.h"
#import "ERNActionHandlerTest.h"

@implementation ERNNullActionHandlerTest {
}

#pragma mark - ERNActionHandler protocol tests

-(void)testActionHandlerProtocolWithNilActionNilResourceFactoryNilRepositoryFactory
{
    [ERNActionHandlerTest testActionHandler:[ERNNullActionHandler create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNActionHandler> actionHandler1 = [ERNNullActionHandler create];
    id<ERNActionHandler> actionHandler2 = [ERNNullActionHandler create];

    //then
    assertThat(actionHandler1, notNilValue());
    assertThat(actionHandler1, equalTo(actionHandler2));
}

@end
