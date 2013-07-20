#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTableViewManagerTest.h"

@implementation ERNTableViewManagerTest {
}

#pragma mark - ERNTableViewManager protocol tests

+(void)testTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    [self testSections:tableViewManager];
    [self testRowsInSection:tableViewManager];
    [self testActionForIndexPath:tableViewManager];
    [self testActionForNilIndexPath:tableViewManager];
    [self testTitleForFooterInSection:tableViewManager];
    [self testTitleForHeaderInSection:tableViewManager];
    [self testHeightForRowAtIndexPath:tableViewManager];
    [self testHeightForRowAtNilIndexPath:tableViewManager];
    [self testHeightForHeaderInSection:tableViewManager];
    [self testHeightForFooterInSection:tableViewManager];
    [self testViewForHeaderInSection:tableViewManager];
    [self testViewForFooterInSection:tableViewManager];
}

+(void)testSections:(id<ERNTableViewManager>)tableViewManager
{
    [tableViewManager sections];
}

+(void)testRowsInSection:(id<ERNTableViewManager>)tableViewManager
{
    [tableViewManager rowsInSection:0];
}

+(void)testActionForIndexPath:(id<ERNTableViewManager>)tableViewManager
{
    if ([tableViewManager respondsToSelector:@selector(actionForIndexPath:)]) {
        [tableViewManager actionForIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    }
}

+(void)testActionForNilIndexPath:(id<ERNTableViewManager>)tableViewManager
{
    if ([tableViewManager respondsToSelector:@selector(actionForIndexPath:)]) {
        [tableViewManager actionForIndexPath:nil];
    }
}

+(void)testTitleForFooterInSection:(id<ERNTableViewManager>)tableViewManager
{
    if ([tableViewManager respondsToSelector:@selector(titleForFooterInSection:)]) {
        assertThat([tableViewManager titleForFooterInSection:0], notNilValue());
    }
}

+(void)testTitleForHeaderInSection:(id<ERNTableViewManager>)tableViewManager
{
    if ([tableViewManager respondsToSelector:@selector(titleForHeaderInSection:)]) {
        assertThat([tableViewManager titleForHeaderInSection:0], notNilValue());
    }
}

+(void)testHeightForRowAtIndexPath:(id<ERNTableViewManager>)tableViewManager
{
    if ([tableViewManager respondsToSelector:@selector(heightForRowAtIndexPath:defaultHeight:)]) {
        [tableViewManager heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                    defaultHeight:0];
    }
}

+(void)testHeightForRowAtNilIndexPath:(id<ERNTableViewManager>)tableViewManager
{
    if ([tableViewManager respondsToSelector:@selector(heightForRowAtIndexPath:defaultHeight:)]) {
        [tableViewManager heightForRowAtIndexPath:nil
                                    defaultHeight:0];
    }
}

+(void)testHeightForHeaderInSection:(id<ERNTableViewManager>)tableViewManager
{
    if ([tableViewManager respondsToSelector:@selector(heightForHeaderInSection:defaultHeight:)]) {
        [tableViewManager heightForHeaderInSection:0
                                    defaultHeight:0];
    }
}

+(void)testHeightForFooterInSection:(id<ERNTableViewManager>)tableViewManager
{
    if ([tableViewManager respondsToSelector:@selector(heightForFooterInSection:defaultHeight:)]) {
        [tableViewManager heightForFooterInSection:0
                                     defaultHeight:0];
    }
}

+(void)testViewForHeaderInSection:(id<ERNTableViewManager>)tableViewManager
{
    if ([tableViewManager respondsToSelector:@selector(viewForHeaderInSection:)]) {
        [tableViewManager viewForHeaderInSection:0];
    }
}

+(void)testViewForFooterInSection:(id<ERNTableViewManager>)tableViewManager
{
    if ([tableViewManager respondsToSelector:@selector(viewForFooterInSection:)]) {
        [tableViewManager viewForFooterInSection:0];
    }
}

@end
