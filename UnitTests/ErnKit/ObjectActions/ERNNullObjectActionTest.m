#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullObjectActionTest.h"
#import "ERNNullObjectAction.h"
#import "ERNObjectActionTest.h"

@implementation ERNNullObjectActionTest {
}

#pragma mark - ERNObjectAction protocol tests

-(void)testObjectActionProtocol
{
    [ERNObjectActionTest testObjectAction:[ERNNullObjectAction create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNObjectAction> objectAction1 = [ERNNullObjectAction create];
    id<ERNObjectAction> objectAction2 = [ERNNullObjectAction create];

    //then
    assertThat(objectAction1, notNilValue());
    assertThat(objectAction2, equalTo(objectAction2));
}

@end
