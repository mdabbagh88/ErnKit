#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNavigationViewControllerTransitionerTest.h"
#import "ERNNavigationViewControllerTransitioner.h"

@implementation ERNNavigationViewControllerTransitionerTest

-(void)testConstructor
{
    [ERNNavigationViewControllerTransitioner createWithNavigationController:nil];
}

@end
