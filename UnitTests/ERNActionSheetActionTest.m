#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNActionSheetActionTest.h"
#import "ERNActionSheetAction.h"

@implementation ERNActionSheetActionTest

-(void)testConstructor
{
    [ERNActionSheetAction actionWithTransitioner:nil
                                    configurator:nil];
}

@end
