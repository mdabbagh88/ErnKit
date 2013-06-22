#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullActionHandlerTest.h"
#import "ERNNullActionHandler.h"

@implementation ERNNullActionHandlerTest

-(void)testSingleton
{
    //given, when
    id<ERNActionHandler> actionHandler1 = [ERNNullActionHandler create];
    id<ERNActionHandler> actionHandler2 = [ERNNullActionHandler create];

    //then
    assertThat(actionHandler1, notNilValue());
    assertThat(actionHandler1, equalTo(actionHandler2));
}

-(void)testActionWithActionNil
{
    //given
    id<ERNActionHandler> actionHandler = [ERNNullActionHandler create];

    [actionHandler actionForObject:nil];
}

-(void)testActionWithAction
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNActionHandler> actionHandler = [ERNNullActionHandler create];

    [actionHandler actionForObject:mockObject];
}


@end
