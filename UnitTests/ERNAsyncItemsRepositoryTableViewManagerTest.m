#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNAsyncItemsRepositoryTableViewManagerTest.h"
#import "ERNAsyncItemsRepositoryTableViewManager.h"

@implementation ERNAsyncItemsRepositoryTableViewManagerTest

-(void)testConstructor
{
    [ERNAsyncItemsRepositoryTableViewManager createWithRepository:nil];
}

-(void)testCellFactoryConstructor
{
    [ERNAsyncItemsRepositoryTableViewManager createWithRepository:nil
                                                      cellFactory:nil];
}

-(void)testCellFactoryActionHandlerConstructor
{
    [ERNAsyncItemsRepositoryTableViewManager createWithRepository:nil
                                                      cellFactory:nil
                                                    actionHandler:nil];
}

@end
