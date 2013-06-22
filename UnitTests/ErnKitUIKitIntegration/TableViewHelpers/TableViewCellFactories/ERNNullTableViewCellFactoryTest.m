#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullTableViewCellFactoryTest.h"
#import "ERNNullTableViewCellFactory.h"
#import "ERNNullTableViewCell.h"

@implementation ERNNullTableViewCellFactoryTest

-(void)testSingleton
{
    //given, when
    id<ERNTableViewCellFactory> factory1 = [ERNNullTableViewCellFactory create];
    id<ERNTableViewCellFactory> factory2 = [ERNNullTableViewCellFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testCellForNilTableViewNilObject
{
    //given
    id<ERNTableViewCellFactory> factory = [ERNNullTableViewCellFactory create];

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
    id<ERNTableViewCellFactory> factory = [ERNNullTableViewCellFactory create];

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
    id<ERNTableViewCellFactory> factory = [ERNNullTableViewCellFactory create];

    //when
    UITableViewCell *cell = [factory cellForTableView:nil
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
    id<ERNTableViewCellFactory> factory = [ERNNullTableViewCellFactory create];

    //when
    UITableViewCell *cell = [factory cellForTableView:mockTableView
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
    id<ERNTableViewCellFactory> factory = [ERNNullTableViewCellFactory create];

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
    id<ERNTableViewCellFactory> factory = [ERNNullTableViewCellFactory create];

    //when
    CGFloat height = [factory cellHeightForObject:mockObject
                                    defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
}

@end
