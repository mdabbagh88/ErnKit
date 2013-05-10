#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewControllerTest.h"
#import "ERNViewController.h"

@implementation ERNViewControllerTest

-(void)testSetSubControllers
{
    //given
    NSArray *array = @[@"one", @"two"];
    ERNViewController *viewController = [ERNViewController new];

    //when
    [viewController setSubControllers:array];

    //then
    assertThat([viewController subControllers], equalTo(array));
}

@end
