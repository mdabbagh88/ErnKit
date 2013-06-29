#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDefaultResourceFactory.h"
#import "ERNDefaultResourceFactoryTest.h"
#import "ERNResourceFactoryTest.h"

@implementation ERNDefaultResourceFactoryTest {
}

#pragma mark - ERNResourceFactory protocol tests

-(void)testResourceFactoryProtocol
{
    [ERNResourceFactoryTest testResourceFactory:[ERNDefaultResourceFactory create]];
}

@end
