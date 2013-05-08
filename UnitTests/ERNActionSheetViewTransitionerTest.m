#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNActionSheetViewTransitionerTest.h"
#import "ERNViewActionSheetTransitioner.h"

@implementation ERNActionSheetViewTransitionerTest

-(void)testConstructor
{
    [ERNViewActionSheetTransitioner createWithView:nil];
}

@end
