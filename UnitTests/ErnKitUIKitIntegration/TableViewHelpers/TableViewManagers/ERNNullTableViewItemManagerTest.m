#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullTableViewItemManagerTest.h"
#import "ERNNullTableViewItemManager.h"
#import "ERNNullTableViewCell.h"

@implementation ERNNullTableViewItemManagerTest

-(void)testSingleton
{
    //given, when
    id<ERNTableViewItemManager> tableViewItemManager1 = [ERNNullTableViewItemManager create];
    id<ERNTableViewItemManager> tableViewItemManager2 = [ERNNullTableViewItemManager create];

    //then
    assertThat(tableViewItemManager1, notNilValue());
    assertThat(tableViewItemManager1, equalTo(tableViewItemManager2));
}

-(void)testCellForNilTableViewNilObject
{
    //given
    id<ERNTableViewItemManager> manager = [ERNNullTableViewItemManager create];

    //when
    UITableViewCell *cell = [manager cellWithCellReuser:nil
                                             fromObject:nil];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
}

-(void)testCellForTableViewNilObject
{
    //given
    id<ERNTableViewItemManager> manager = [ERNNullTableViewItemManager create];

    //when
    UITableViewCell *cell = [manager cellWithCellReuser:
                             ^UITableViewCell *(NSString *identifier) {
                                 return nil;
                             }
                                             fromObject:nil];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
}

-(void)testCellForNilTableViewObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNTableViewItemManager> manager = [ERNNullTableViewItemManager create];

    //when
    UITableViewCell *cell = [manager cellWithCellReuser:nil
                                             fromObject:mockObject];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
    [mockObject verify];
}

-(void)testCellForTableViewObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<ERNTableViewItemManager> manager = [ERNNullTableViewItemManager create];

    //when
    UITableViewCell *cell = [manager cellWithCellReuser:
                             ^UITableViewCell *(NSString *identifier) {
                                 return nil;
                             }
                                             fromObject:mockObject];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
    [mockObject verify];
    [mockTableView verify];
}

-(void)testHeightForNilObject
{
    //given
    CGFloat defaultHeight = 34.0f;
    id<ERNTableViewItemManager> manager = [ERNNullTableViewItemManager create];

    //when
    CGFloat height = [manager cellHeightForObject:nil
                                    defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
}

-(void)testHeightForObject
{
    //given
    CGFloat defaultHeight = 34.0f;
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNTableViewItemManager> manager = [ERNNullTableViewItemManager create];

    //when
    CGFloat height = [manager cellHeightForObject:mockObject
                                    defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
    [mockObject verify];
}

-(void)testActionForNilObject
{
    //given
    id<ERNTableViewItemManager> manager = [ERNNullTableViewItemManager create];

    //when, then
    [manager actionForObject:nil];
}

-(void)testActionForObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNTableViewItemManager> manager = [ERNNullTableViewItemManager create];

    //when
    [manager actionForObject:mockObject];

    //then
    [mockObject verify];
}

@end
