#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNAsyncItemsRepositoryTableViewManagerTest.h"
#import "ERNAsyncItemsRepositoryTableViewManager.h"

@implementation ERNAsyncItemsRepositoryTableViewManagerTest

-(void)testConstructor
{
    [ERNAsyncItemsRepositoryTableViewManager tableViewManagerWithRepository:nil];
}

-(void)testCellFactoryConstructor
{
    [ERNAsyncItemsRepositoryTableViewManager tableViewManagerWithRepository:nil
                                                                cellFactory:nil];
}

-(void)testCellFactoryActionHandlerConstructor
{
    [ERNAsyncItemsRepositoryTableViewManager tableViewManagerWithRepository:nil
                                                                cellFactory:nil
                                                              actionHandler:nil];
}

@end
