#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTableViewItemManagerTest.h"

@implementation ERNTableViewItemManagerTest {
}

#pragma mark - ERNTableViewItemManager protocol tests

+(void)testTableViewItemManager:(id<ERNTableViewItemManager>)tableViewItemManager
{
    [self testActionForNilObject:tableViewItemManager];
    [self testActionForObject:tableViewItemManager];
    [self testCellWithNilCellReuserFromNilObject:tableViewItemManager];
    [self testCellWithCellReuserFromNilObject:tableViewItemManager];
    [self testCellWithNilCellReuserFromObject:tableViewItemManager];
    [self testCellWithCellReuserFromObject:tableViewItemManager];
    [self testCellHeightForNilObject:tableViewItemManager];
    [self testCellHeightForObject:tableViewItemManager];
}

+(void)testActionForNilObject:(id<ERNTableViewItemManager>)tableViewItemManager
{
    [tableViewItemManager actionForObject:nil];
}

+(void)testActionForObject:(id<ERNTableViewItemManager>)tableViewItemManager
{
    id mockObject = [OCMockObject niceMockForClass:[NSObject class]];
    [tableViewItemManager actionForObject:mockObject];
}

+(void)testCellWithNilCellReuserFromNilObject:(id<ERNTableViewItemManager>)tableViewItemManager
{
    assertThat([tableViewItemManager cellWithCellReuser:nil
                                             fromObject:nil],
               instanceOf([UITableViewCell class]));
}

+(void)testCellWithCellReuserFromNilObject:(id<ERNTableViewItemManager>)tableViewItemManager
{
    assertThat([tableViewItemManager cellWithCellReuser:
                ^UITableViewCell *(NSString *identifier) {
                    return nil;
                }
                                             fromObject:nil],
               instanceOf([UITableViewCell class]));
}

+(void)testCellWithNilCellReuserFromObject:(id<ERNTableViewItemManager>)tableViewItemManager
{
    id mockObject = [OCMockObject niceMockForClass:[NSObject class]];
    assertThat([tableViewItemManager cellWithCellReuser:nil
                                             fromObject:mockObject],
               instanceOf([UITableViewCell class]));
}

+(void)testCellWithCellReuserFromObject:(id<ERNTableViewItemManager>)tableViewItemManager
{
    id mockObject = [OCMockObject niceMockForClass:[NSObject class]];
    assertThat([tableViewItemManager cellWithCellReuser:
     ^UITableViewCell *(NSString *identifier) {
        return nil;
     }
                                             fromObject:mockObject],
               instanceOf([UITableViewCell class]));
}

+(void)testCellHeightForNilObject:(id<ERNTableViewItemManager>)tableViewItemManager
{
    [tableViewItemManager cellHeightForObject:nil
                                defaultHeight:0];
}

+(void)testCellHeightForObject:(id<ERNTableViewItemManager>)tableViewItemManager
{
    id mockObject = [OCMockObject niceMockForClass:[NSObject class]];
    [tableViewItemManager cellHeightForObject:mockObject
                                defaultHeight:0];
}

@end
