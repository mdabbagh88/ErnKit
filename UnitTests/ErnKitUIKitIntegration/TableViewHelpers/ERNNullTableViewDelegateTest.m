#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullTableViewDelegateTest.h"
#import "ERNNullTableViewDelegate.h"

@implementation ERNNullTableViewDelegateTest {
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<UITableViewDelegate> tableViewDataSource1 = [ERNNullTableViewDelegate create];
    id<UITableViewDelegate> tableViewDataSource2 = [ERNNullTableViewDelegate create];

    //then
    assertThat(tableViewDataSource1, notNilValue());
    assertThat(tableViewDataSource1, equalTo(tableViewDataSource2));
}


@end
