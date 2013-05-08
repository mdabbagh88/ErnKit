#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNViewControllerActionTest.h"
#import "ERNViewControllerAction.h"

@implementation ERNViewControllerActionTest

-(void)testConstructor
{
    [ERNViewControllerAction createWithTransitioner:nil
                                       configurator:nil];
}

@end
