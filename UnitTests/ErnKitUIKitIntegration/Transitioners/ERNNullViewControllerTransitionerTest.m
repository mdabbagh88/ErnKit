#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullViewControllerTransitionerTest.h"
#import "ERNViewControllerTransitionerTest.h"
#import "ERNNullViewControllerTransitioner.h"

@implementation ERNNullViewControllerTransitionerTest {
}

#pragma mark - ERNViewControllerTransitioner protocol tests

-(void)testViewControllerTransitionerProtocol
{
    [ERNViewControllerTransitionerTest testViewControllerTransitioner:
     [ERNNullViewControllerTransitioner create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNViewControllerTransitioner> transitioner1 = [ERNNullViewControllerTransitioner create];
    id<ERNViewControllerTransitioner> transitioner2 = [ERNNullViewControllerTransitioner create];

    //then
    assertThat(transitioner1, notNilValue());
    assertThat(transitioner1, equalTo(transitioner2));
}

@end
