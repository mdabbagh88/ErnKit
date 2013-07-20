#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullActionSheetTransitionerTest.h"
#import "ERNActionSheetTransitionerTest.h"
#import "ERNNullActionSheetTransitioner.h"

@implementation ERNNullActionSheetTransitionerTest {
}

#pragma mark - ERNActionSheetTransitioner protocol tests

-(void)testViewControllerTransitionerProtocol
{
    [ERNActionSheetTransitionerTest testActionSheetTransitioner:
     [ERNNullActionSheetTransitioner create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNActionSheetTransitioner> transitioner1 = [ERNNullActionSheetTransitioner create];
    id<ERNActionSheetTransitioner> transitioner2 = [ERNNullActionSheetTransitioner create];

    //then
    assertThat(transitioner1, notNilValue());
    assertThat(transitioner1, equalTo(transitioner2));
}

@end
