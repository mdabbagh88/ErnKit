#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNExternalUrlActionTest.h"
#import "ERNExternalUrlAction.h"

@implementation ERNExternalUrlActionTest

-(void)testConstructor
{
    assertThat([ERNExternalUrlAction createWithApplication:nil], notNilValue());
}

@end
