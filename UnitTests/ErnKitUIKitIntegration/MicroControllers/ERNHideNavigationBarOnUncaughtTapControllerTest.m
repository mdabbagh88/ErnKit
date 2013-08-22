#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNHideNavigationBarOnUncaughtTapControllerTest.h"
#import "ERNHideNavigationBarOnUncaughtTapController.h"

@implementation ERNHideNavigationBarOnUncaughtTapControllerTest {
}

#pragma mark - class tests

-(void)testConstructorNilViewController
{
    assertThat([ERNHideNavigationBarOnUncaughtTapController createWithViewController:nil],
               notNilValue());
}

@end
