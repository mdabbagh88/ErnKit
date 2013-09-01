#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTableViewItemManager.h"
#import "ERNAsyncItemsRepositoryTableViewManagerTest.h"
#import "ERNTableViewManagerTest.h"
#import "ERNAsyncItemsRepositoryTableViewManager.h"

@implementation ERNAsyncItemsRepositoryTableViewManagerTest {
}

#pragma mark - ERNTableViewManager protocol tests

-(void)testTableViewManagerProtocolWithNilRepositoryNilItemManager
{
    [ERNTableViewManagerTest testTableViewManager:
     [ERNAsyncItemsRepositoryTableViewManager createWithRepository:nil
                                                       itemManager:nil]];
}

-(void)testTableViewManagerProtocolWithRepositoryNilItemManager
{
    id mockRepository =
    [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    [ERNTableViewManagerTest testTableViewManager:
     [ERNAsyncItemsRepositoryTableViewManager createWithRepository:mockRepository
                                                       itemManager:nil]];
}

-(void)testTableViewManagerProtocolWithNilRepositoryItemManager
{
    id mockItemManager =
    [OCMockObject niceMockForProtocol:@protocol(ERNTableViewItemManager)];
    [ERNTableViewManagerTest testTableViewManager:
     [ERNAsyncItemsRepositoryTableViewManager createWithRepository:nil
                                                       itemManager:mockItemManager]];
}

-(void)testTableViewManagerProtocolWithRepositoryItemManager
{
    id mockRepository =
    [OCMockObject niceMockForProtocol:@protocol(ERNAsyncPaginatedItemsRepository)];
    id mockItemManager =
    [OCMockObject niceMockForProtocol:@protocol(ERNTableViewItemManager)];
    [ERNTableViewManagerTest testTableViewManager:
     [ERNAsyncItemsRepositoryTableViewManager createWithRepository:mockRepository
                                                       itemManager:mockItemManager]];
}

#pragma mark - class tests

-(void)testSectionsNilRepository
{
    //given
    id<ERNTableViewManager> manager =
    [ERNAsyncItemsRepositoryTableViewManager createWithRepository:nil
                                                      itemManager:nil];

    //when
    NSInteger sections = [manager sections];

    //then
    assertThatInteger(sections, equalToInteger(1));
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

@end
