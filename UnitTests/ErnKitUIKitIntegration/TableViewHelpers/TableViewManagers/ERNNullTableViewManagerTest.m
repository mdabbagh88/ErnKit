#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullTableViewManagerTest.h"
#import "ERNTableViewManagerTest.h"
#import "ERNNullTableViewManager.h"

@implementation ERNNullTableViewManagerTest {
}

#pragma mark - ERNTableViewManager protocol tests

-(void)testTableViewManagerProtocol
{
    [ERNTableViewManagerTest testTableViewManager:
     [ERNNullTableViewManager create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNTableViewManager> tableViewManager1 = [ERNNullTableViewManager create];
    id<ERNTableViewManager> tableViewManager2 = [ERNNullTableViewManager create];

    //then
    assertThat(tableViewManager1, notNilValue());
    assertThat(tableViewManager1, equalTo(tableViewManager2));
}

-(void)testSections
{
    //given
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    NSInteger sections = [tableViewManager sections];

    //then
    assertThatInteger(sections, equalToInteger(0));
}

-(void)testRowsInSection
{
    //given
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    NSInteger rows = [tableViewManager rowsInSection:0];

    //then
    assertThatInteger(rows, equalToInteger(0));
}

@end
