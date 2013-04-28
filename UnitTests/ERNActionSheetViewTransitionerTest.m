#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNActionSheetViewTransitionerTest.h"
#import "ERNActionSheetViewTransitioner.h"

@implementation ERNActionSheetViewTransitionerTest

-(void)testConstructor
{
    [ERNActionSheetViewTransitioner transitionerWithView:nil];
}

@end
