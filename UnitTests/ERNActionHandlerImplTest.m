#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNActionHandlerImplTest.h"
#import "ERNActionHandlerImpl.h"

@implementation ERNActionHandlerImplTest

-(void)testConstructor
{
    [ERNActionHandlerImpl actionHandlerWithAction:nil
                                   urlMimeFactory:nil];
}

@end
