#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullViewControllerDismisserTest.h"
#import "ERNViewControllerDismisserTest.h"
#import "ERNNullViewControllerDismisser.h"

@implementation ERNNullViewControllerDismisserTest {
}

#pragma mark - ERNViewControllerDismisser protocol tests

-(void)testViewControllerDismisserProtocol
{
    [ERNViewControllerDismisserTest testViewControllerDismisser:
     [ERNNullViewControllerDismisser create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNViewControllerDismisser> dismisser1 = [ERNNullViewControllerDismisser create];
    id<ERNViewControllerDismisser> dismisser2 = [ERNNullViewControllerDismisser create];

    //then
    assertThat(dismisser1, notNilValue());
    assertThat(dismisser1, equalTo(dismisser2));
}

@end
