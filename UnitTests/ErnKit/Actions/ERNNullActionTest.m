#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullActionTest.h"
#import "ERNNullAction.h"
#import "ERNActionTest.h"

@implementation ERNNullActionTest {
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocol
{
    [ERNActionTest testAction:[ERNNullAction create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    assertThat([ERNNullAction create], notNilValue());
    assertThat([ERNNullAction create], equalTo([ERNNullAction create]));
}

@end
