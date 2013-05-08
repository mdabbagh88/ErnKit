#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNTableViewDelegateTest.h"
#import "ERNTableViewDelegate.h"

@implementation ERNTableViewDelegateTest

-(void)testConstructor
{
    [ERNTableViewDelegate createWithTableViewManager:nil];
}

@end
