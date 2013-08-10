#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNBlockAction.h"
#import "ERNBlockActionTest.h"
#import "ERNActionTest.h"


@implementation ERNBlockActionTest {
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolNilBlock
{
    [ERNActionTest testAction:[ERNBlockAction createWithBlock:nil]];
}

-(void)testActionProtocolBlock
{
    [ERNActionTest testAction:[ERNBlockAction createWithBlock:^(ERNResource *resource) {
    }]];
}

-(void)testBlockCalled
{
    id mockResource = [OCMockObject mockForClass:[ERNResource class]];
    __block BOOL called = NO;
    id<ERNAction> action = [ERNBlockAction createWithBlock:^(ERNResource *resource) {
        called = YES;
        assertThat(resource, equalTo(mockResource));
    }];
    [action actionForResource:mockResource];
    assertThatBool(called, equalToBool(YES));
}

-(void)testBlockNotCalledWithNil
{
    id nilResource = nil;
    __block BOOL called = NO;
    id<ERNAction> action = [ERNBlockAction createWithBlock:^(ERNResource *resource) {
        called = YES;
    }];
    [action actionForResource:nilResource];
    assertThatBool(called, equalToBool(NO));
}

@end
