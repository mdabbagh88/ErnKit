#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullUrlMimeFactoryTest.h"
#import "ERNNullUrlMimeFactory.h"

@implementation ERNNullUrlMimeFactoryTest

-(void)testConstructor
{
    [ERNNullUrlMimeFactory factory];
}

@end
