#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullTableViewManagerTest.h"
#import "ERNNullTableViewManager.h"

@implementation ERNNullTableViewManagerTest

-(void)testSingleton
{
    //given, when
    id<ERNTableViewManager> tableViewManager1 = [ERNNullTableViewManager create];
    id<ERNTableViewManager> tableViewManager2 = [ERNNullTableViewManager create];

    //then
    assertThat(tableViewManager1, notNilValue());
    assertThat(tableViewManager1, equalTo(tableViewManager2));
}

-(void)testCellForNilIndexPathNilReuser
{
    //given
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    UITableViewCell *cell = [tableViewManager cellForIndexPath:nil
                                                    cellReuser:nil];

    //then
    assertThat(cell, notNilValue());
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

-(void)testCellForNilIndexPathReuser
{
    //given
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    UITableViewCell *cell = [tableViewManager cellForIndexPath:nil
                                                    cellReuser:
                             ^UITableViewCell *(NSString *identifier) {
                                 return nil;
                             }];

    //then
    assertThat(cell, notNilValue());
}

-(void)testCellForIndexPathNilReuser
{
    //given
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    UITableViewCell *cell = [tableViewManager cellForIndexPath:mockIndexPath
                                                    cellReuser:nil];

    //then
    assertThat(cell, notNilValue());
    [mockIndexPath verify];
}

-(void)testCellForIndexPathReuser
{
    //given
    id mockIndexPath = [OCMockObject mockForClass:[NSIndexPath class]];
    id<ERNTableViewManager> tableViewManager = [ERNNullTableViewManager create];

    //when
    UITableViewCell *cell = [tableViewManager cellForIndexPath:mockIndexPath
                                                    cellReuser:
                             ^UITableViewCell *(NSString *identifier) {
                                 return nil;
                             }];

    //then
    assertThat(cell, notNilValue());
    [mockIndexPath verify];
}

@end
