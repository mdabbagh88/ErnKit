#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewControllerTitleItemRepositoryControllerTest.h"
#import "ERNViewControllerTitleItemRepositoryController.h"

@implementation ERNViewControllerTitleItemRepositoryControllerTest {
}

#pragma mark - class tests

-(void)testConstructorNilViewControllerNilRepository
{
    assertThat([ERNViewControllerTitleItemRepositoryController createWithViewController:nil
                                                                             repository:nil],
               notNilValue());
}

@end
