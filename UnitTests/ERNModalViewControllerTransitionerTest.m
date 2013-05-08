#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNModalViewControllerTransitionerTest.h"
#import "ERNModalViewControllerTransitioner.h"

@implementation ERNModalViewControllerTransitionerTest

-(void)testConstructor
{
    [ERNModalViewControllerTransitioner createWithSourceViewController:nil];
}

@end
