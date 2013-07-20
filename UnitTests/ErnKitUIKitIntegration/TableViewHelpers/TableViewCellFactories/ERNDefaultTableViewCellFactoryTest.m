#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNDefaultTableViewCellFactoryTest.h"
#import "ERNTableViewCellFactoryTest.h"
#import "ERNDefaultTableViewCellFactory.h"
#import "ERNNullTableViewCell.h"

@implementation ERNDefaultTableViewCellFactoryTest {
}

#pragma mark - ERNTableViewCellFactory protocol tests

-(void)testTableViewCellFactoryProtocol
{
    [ERNTableViewCellFactoryTest testTableViewCellFactory:
     [ERNDefaultTableViewCellFactory create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNTableViewCellFactory> factory1 = [ERNDefaultTableViewCellFactory create];
    id<ERNTableViewCellFactory> factory2 = [ERNDefaultTableViewCellFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testCellForNilReuserNilObject
{
    //given
    id<ERNTableViewCellFactory> factory = [ERNDefaultTableViewCellFactory create];

    //when
    UITableViewCell *cell = [factory cellWithCellReuser:nil
                                             fromObject:nil];

    //then
    assertThat(cell, instanceOf([ERNNullTableViewCell class]));
}

-(void)testCellForReuserNilObject
{
    //given
    id<ERNTableViewCellFactory> factory = [ERNDefaultTableViewCellFactory create];

    //when
    UITableViewCell *cell = [factory cellWithCellReuser:
                             ^UITableViewCell *(NSString *identifier) {
                                 return nil;
                             }
                                             fromObject:nil];

    //then
    assertThat(cell, instanceOf([ERNNullTableViewCell class]));
}

-(void)testCellForNilReuserViewObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNTableViewCellFactory> factory = [ERNDefaultTableViewCellFactory create];

    //when
    UITableViewCell *cell = [factory cellWithCellReuser:nil
                                             fromObject:mockObject];

    //then
    assertThat(cell, instanceOf([UITableViewCell class]));
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
    id<ERNTableViewCellFactory> factory = [ERNDefaultTableViewCellFactory create];

    //when
    UITableViewCell *cell = [factory cellWithCellReuser:
                             ^UITableViewCell *(NSString *identifier) {
                                 return mockTableViewCell;
                             }
                                             fromObject:mockObject];
    //then
    assertThat(cell, equalTo(mockTableViewCell));
    [mockObject verify];
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
