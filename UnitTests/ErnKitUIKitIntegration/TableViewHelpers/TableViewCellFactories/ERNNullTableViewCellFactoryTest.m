#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullTableViewCellFactoryTest.h"
#import "ERNNullTableViewCellFactory.h"
#import "ERNNullTableViewCell.h"
#import "ERNTableViewCellFactoryTest.h"

@implementation ERNNullTableViewCellFactoryTest {
}

#pragma mark - ERNTableViewCellFactory protocol tests

-(void)testTableViewCellFactoryProtocol
{
    [ERNTableViewCellFactoryTest testTableViewCellFactory:
     [ERNNullTableViewCellFactory create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNTableViewCellFactory> factory1 = [ERNNullTableViewCellFactory create];
    id<ERNTableViewCellFactory> factory2 = [ERNNullTableViewCellFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
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
