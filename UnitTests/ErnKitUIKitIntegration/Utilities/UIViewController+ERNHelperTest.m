#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "UIViewController+ERNHelperTest.h"
#import "UIViewController+ERNHelper.h"

@implementation UIViewController_ERNHelperTest

-(void)testNilSubControllers
{
    //given
    UIViewController *viewController = [UIViewController new];

    //when
    NSArray *array = [viewController ERN_getMicroControllers];

    //then
    assertThat(array, nilValue());
}

-(void)testSubControllers
{
    //given
    NSArray *expectedArray = @[@"one", @"two"];
    UIViewController *viewController = [UIViewController new];

    //when
    [viewController ERN_addMicroController:expectedArray[0]];
    [viewController ERN_addMicroController:expectedArray[1]];
    NSArray *array = [viewController ERN_getMicroControllers];

    //then
    assertThat(array, equalTo(expectedArray));
}

@end
