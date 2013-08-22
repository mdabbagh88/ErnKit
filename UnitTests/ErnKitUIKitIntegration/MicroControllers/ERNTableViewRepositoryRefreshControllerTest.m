#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTableViewRepositoryRefreshControllerTest.h"
#import "ERNTableViewRepositoryRefreshController.h"

@implementation ERNTableViewRepositoryRefreshControllerTest {
}

#pragma mark - class tests

-(void)testConstructorNilTableViewNilRepository
{
    assertThat([ERNTableViewRepositoryRefreshController createWithTableView:nil
                                                                 repository:nil],
               notNilValue());
}

@end
