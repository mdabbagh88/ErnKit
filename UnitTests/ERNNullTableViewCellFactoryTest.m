#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullTableViewCellFactoryTest.h"
#import "ERNNullTableViewCellFactory.h"

@implementation ERNNullTableViewCellFactoryTest

-(void)testConstructor
{
    [ERNNullTableViewCellFactory create];
}

@end
