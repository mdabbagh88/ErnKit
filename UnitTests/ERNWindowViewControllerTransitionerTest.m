#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNWindowViewControllerTransitionerTest.h"
#import "ERNWindowViewControllerTransitioner.h"

@implementation ERNWindowViewControllerTransitionerTest

-(void)testConstructor
{
    [ERNWindowViewControllerTransitioner createWithWindow:nil];
}

@end
