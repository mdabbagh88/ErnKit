#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDefaultActionHandlerTest.h"
#import "ERNDefaultActionHandler.h"

@implementation ERNDefaultActionHandlerTest

-(void)testConstructor
{
    [ERNDefaultActionHandler createWithAction:nil
                               urlMimeFactory:nil];
}

@end
