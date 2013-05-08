#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRoutingUrlMimeFactoryTest.h"
#import "ERNRoutingUrlMimeFactory.h"

@implementation ERNRoutingUrlMimeFactoryTest

-(void)testConstructor
{
    [ERNRoutingUrlMimeFactory createWithMappings:nil];
}

@end
