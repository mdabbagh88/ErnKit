#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNDefaultTableViewCellFactoryTest.h"
#import "ERNDefaultTableViewCellFactory.h"
#import "ERNNullTableViewCell.h"

@implementation ERNDefaultTableViewCellFactoryTest

-(void)testSingleton
{
    //given, when
    id<ERNTableViewCellFactory> factory1 = [ERNDefaultTableViewCellFactory create];
    id<ERNTableViewCellFactory> factory2 = [ERNDefaultTableViewCellFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testCellForNilTableViewNilObject
{
    //given
    id<ERNTableViewCellFactory> factory = [ERNDefaultTableViewCellFactory create];

    //when
    UITableViewCell *cell = [factory cellForTableView:nil
                                           fromObject:nil];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
}

-(void)testCellForTableViewNilObject
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<ERNTableViewCellFactory> factory = [ERNDefaultTableViewCellFactory create];

    //when
    UITableViewCell *cell = [factory cellForTableView:mockTableView
                                           fromObject:nil];

    //then
    assertThat([cell class], equalTo([ERNNullTableViewCell class]));
}

-(void)testCellForNilTableViewObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNTableViewCellFactory> factory = [ERNDefaultTableViewCellFactory create];

    //when
    UITableViewCell *cell = [factory cellForTableView:nil
                                           fromObject:mockObject];

    //then
    assertThat([cell class], equalTo([UITableViewCell class]));
    assertThat([[cell textLabel] text], equalTo([mockObject description]));
    [mockObject verify];
}

-(void)testCellForTableViewObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id mockLabel = [OCMockObject mockForClass:[UILabel class]];
    [[mockLabel expect] setText:[mockObject description]];
    id mockTableViewCell = [OCMockObject mockForClass:[UITableViewCell class]];
    [[[mockTableViewCell expect] andReturn:mockLabel] textLabel];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    [[[mockTableView expect] andReturn:mockTableViewCell] dequeueReusableCellWithIdentifier:OCMOCK_ANY];
    id<ERNTableViewCellFactory> factory = [ERNDefaultTableViewCellFactory create];

    //when
    UITableViewCell *cell = [factory cellForTableView:mockTableView
                                           fromObject:mockObject];

    //then
    assertThat(cell, equalTo(mockTableViewCell));
    [mockObject verify];
    [mockTableView verify];
    [mockTableViewCell verify];
}

-(void)testHeightForNilObject
{
    //given
    CGFloat defaultHeight = 34.0f;
    id<ERNTableViewCellFactory> factory = [ERNDefaultTableViewCellFactory create];

    //when
    CGFloat height = [factory cellHeightForObject:nil
                                    defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
}

-(void)testHeightForObject
{
    //given
    CGFloat defaultHeight = 34.0f;
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNTableViewCellFactory> factory = [ERNDefaultTableViewCellFactory create];

    //when
    CGFloat height = [factory cellHeightForObject:mockObject
                                    defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
}

@end
