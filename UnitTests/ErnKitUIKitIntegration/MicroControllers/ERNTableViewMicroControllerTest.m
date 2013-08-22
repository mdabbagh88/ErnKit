#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTableViewMicroControllerTest.h"
#import "ERNTableViewMicroController.h"

@implementation ERNTableViewMicroControllerTest {
}

#pragma mark - class tests

-(void)testConstructorNilDelegateNilDataSourceNilSuperView
{
    assertThat([ERNTableViewMicroController createWithTableViewDelegate:nil
                                         tableViewDataSource:nil
                                                   superView:nil],
               notNilValue());
}

@end
