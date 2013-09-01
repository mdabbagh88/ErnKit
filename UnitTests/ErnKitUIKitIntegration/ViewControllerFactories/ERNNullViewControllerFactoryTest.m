#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullViewControllerFactoryTest.h"
#import "ERNViewControllerFactoryTest.h"
#import "ERNNullViewControllerFactory.h"

@implementation ERNNullViewControllerFactoryTest {
}

#pragma mark - ERNViewControllerFactory protocol tests

-(void)testViewControllerFactoryProtocol
{
    [ERNViewControllerFactoryTest testViewControllerFactory:
     [ERNNullViewControllerFactory create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNViewControllerFactory> factory1 = [ERNNullViewControllerFactory create];
    id<ERNViewControllerFactory> factory2 = [ERNNullViewControllerFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

@end
