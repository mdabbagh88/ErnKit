#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNTableViewDataSourceTest.h"
#import "ERNTableViewDataSource.h"

@implementation ERNTableViewDataSourceTest

-(void)testConstructor
{
    [ERNTableViewDataSource createWithTableViewManager:nil];
}

@end
