#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNRefreshControlRepositoryRefreshControllerTest.h"
#import "ERNRefreshControlRepositoryRefreshController.h"

@implementation ERNRefreshControlRepositoryRefreshControllerTest {
}

#pragma mark - class tests

-(void)testConstructorNilRefreshControlNilRepository
{
    assertThat([ERNRefreshControlRepositoryRefreshController createWithRefreshControl:nil
                                                                           repository:nil],
               notNilValue());
}

@end
