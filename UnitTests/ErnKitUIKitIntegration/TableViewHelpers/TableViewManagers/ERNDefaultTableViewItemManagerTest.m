#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNDefaultTableViewItemManagerTest.h"
#import "ERNTableViewItemManagerTest.h"
#import "ERNDefaultTableViewItemManager.h"
#import "ERNNullTableViewCellFactory.h"
#import "ERNNullObjectAction.h"

@implementation ERNDefaultTableViewItemManagerTest {
}

#pragma mark - ERNTableViewItemManager protocol tests

-(void)testTableViewItemManagerProtocolNilCellFactoryNilActionHandler
{
    [ERNTableViewItemManagerTest testTableViewItemManager:
     [ERNDefaultTableViewItemManager createWithCellFactory:nil
                                             objectAction:nil]];
}

-(void)testTableViewItemManagerProtocolNilCellFactoryActionHandler
{
    [ERNTableViewItemManagerTest testTableViewItemManager:
     [ERNDefaultTableViewItemManager createWithCellFactory:nil
                                             objectAction:[ERNNullObjectAction create]]];
}

-(void)testTableViewItemManagerProtocolCellFactoryNilActionHandler
{
    [ERNTableViewItemManagerTest testTableViewItemManager:
     [ERNDefaultTableViewItemManager createWithCellFactory:[ERNNullTableViewCellFactory create]
                                             objectAction:nil]];
}

-(void)testTableViewItemManagerProtocolCellFactoryActionHandler
{
    [ERNTableViewItemManagerTest testTableViewItemManager:
     [ERNDefaultTableViewItemManager createWithCellFactory:[ERNNullTableViewCellFactory create]
                                             objectAction:[ERNNullObjectAction create]]];
}

@end
