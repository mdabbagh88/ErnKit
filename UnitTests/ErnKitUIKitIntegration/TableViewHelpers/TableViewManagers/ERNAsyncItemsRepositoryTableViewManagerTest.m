#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNAsyncItemsRepositoryTableViewManagerTest.h"
#import "ERNAsyncItemsRepositoryTableViewManager.h"

@implementation ERNAsyncItemsRepositoryTableViewManagerTest

-(void)testNilTableViewCellForNilIndexPathNilRepository
{
    //given
    id<ERNTableViewManager> manager =
    [ERNAsyncItemsRepositoryTableViewManager createWithRepository:nil
                                                      itemManager:nil];

    //when
    UITableViewCell *cell = [manager tableView:nil
                              cellForIndexPath:nil];

    //then
    assertThat(cell, notNilValue());
}

-(void)testSectionsNilRepository
{
    //given
    id<ERNTableViewManager> manager =
    [ERNAsyncItemsRepositoryTableViewManager createWithRepository:nil
                                                      itemManager:nil];

    //when
    NSInteger sections = [manager sections];

    //then
    assertThatInteger(sections, equalToInteger(0));
}

-(void)testRowsInSectionNilRepository
{
    //given
    id<ERNTableViewManager> manager =
    [ERNAsyncItemsRepositoryTableViewManager createWithRepository:nil
                                                      itemManager:nil];

    //when
    NSInteger rows = [manager rowsInSection:3];

    //then
    assertThatInteger(rows, equalToInteger(0));
}

-(void)testActionForNilIndexPathNilRepository
{
    //given
    id<ERNTableViewManager> manager =
    [ERNAsyncItemsRepositoryTableViewManager createWithRepository:nil
                                                      itemManager:nil];

    //when
    [manager actionForIndexPath:nil];
}

@end
