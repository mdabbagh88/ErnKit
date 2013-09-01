#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullActionSheetFactoryTest.h"
#import "ERNActionSheetFactoryTest.h"
#import "ERNNullActionSheetFactory.h"

@implementation ERNNullActionSheetFactoryTest {
}

#pragma mark - ERNViewControllerFactory protocol tests

-(void)testViewControllerFactoryProtocol
{
    [ERNActionSheetFactoryTest testActionSheetFactory:
     [ERNNullActionSheetFactory create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNActionSheetFactory> factory1 = [ERNNullActionSheetFactory create];
    id<ERNActionSheetFactory> factory2 = [ERNNullActionSheetFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

@end
