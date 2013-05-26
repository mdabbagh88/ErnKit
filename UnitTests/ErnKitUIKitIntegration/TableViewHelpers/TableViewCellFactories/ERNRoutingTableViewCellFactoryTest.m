#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNRoutingTableViewCellFactoryTest.h"
#import "ERNRoutingTableViewCellFactory.h"

@interface ERNMockTableViewCellFactory : NSObject <ERNTableViewCellFactory>
@end

@implementation ERNMockTableViewCellFactory

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    return nil;
}

-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight
{
    return 0;
}

@end

@implementation ERNRoutingTableViewCellFactoryTest

-(void)testCellForNilTableViewFromNilObjectNilMappingsNilDefaultFactory
{
    //given
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:nil];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:nil
                                               fromObject:nil];

    //then
    assertThat(cell, notNilValue());
}

-(void)testCellForNilTableViewFromNilObjectNilMappingsDefaultFactory
{
    //given
    id mockDefaultFactory = [OCMockObject niceMockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:mockDefaultFactory];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:nil
                                               fromObject:nil];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
}

-(void)testCellForNilTableViewFromNilObjectMappingsDefaultFactory
{
    //given
    NSString *objectClassName = @"ClassName";
    id mockFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}
                                        defaultFactory:mockDefaultFactory];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:nil
                                               fromObject:nil];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
    [mockFactory verify];
}

-(void)testCellForTableViewFromNilObjectNilMappingsNilDefaultFactory
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:nil];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:mockTableView
                                               fromObject:nil];

    //then
    assertThat(cell, notNilValue());
    [mockTableView verify];
}

-(void)testCellForTableViewFromNilObjectNilMappingsDefaultFactory
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id mockDefaultFactory = [OCMockObject niceMockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:mockDefaultFactory];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:mockTableView
                                               fromObject:nil];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
    [mockTableView verify];
}

-(void)testCellForTableViewFromNilObjectMappingsDefaultFactory
{
    //given
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    NSString *objectClassName = @"ClassName";
    id mockFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}
                                        defaultFactory:mockDefaultFactory];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:mockTableView
                                               fromObject:nil];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
    [mockFactory verify];
    [mockTableView verify];
}

-(void)testCellForNilTableViewFromObjectNilMappingsNilDefaultFactory
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:nil];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:nil
                                               fromObject:mockObject];

    //then
    assertThat(cell, notNilValue());
    [mockObject verify];
}

-(void)testCellForNilTableViewFromObjectNilMappingsDefaultFactory
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:mockDefaultFactory];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:nil
                                               fromObject:mockObject];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
    [mockObject verify];
}

-(void)testCellForNilTableViewFromObjectMappingsDefaultFactory
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    NSString *objectClassName = NSStringFromClass([mockObject class]);
    id mockFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}
                                        defaultFactory:mockDefaultFactory];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:nil
                                               fromObject:mockObject];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
    [mockFactory verify];
    [mockObject verify];
}

-(void)testCellForTableViewFromObjectNilMappingsNilDefaultFactory
{
    //given
    id mockTableView = [OCMockObject niceMockForClass:[UITableView class]];
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:nil];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:mockTableView
                                               fromObject:mockObject];

    //then
    assertThat(cell, notNilValue());
    [mockTableView verify];
    [mockObject verify];
}

-(void)testCellForTableViewFromObjectNilMappingsDefaultFactory
{
    //given
    id mockCell = [OCMockObject mockForClass:[UITableViewCell class]];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    [[[mockDefaultFactory expect] andReturn:mockCell] cellForTableView:mockTableView
                                                            fromObject:mockObject];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:mockDefaultFactory];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:mockTableView
                                               fromObject:mockObject];

    //then
    assertThat(cell, equalTo(mockCell));
    [mockDefaultFactory verify];
    [mockTableView verify];
    [mockObject verify];
}

-(void)testCellForTableViewFromObjectMappingsDefaultFactory
{
    //given
    BOOL conforms = YES;
    id mockCell = [OCMockObject mockForClass:[UITableViewCell class]];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    NSString *objectClassName = NSStringFromClass([mockObject class]);
    id mockFactory = [OCMockObject niceMockForClass:[ERNMockTableViewCellFactory class]];
    [[[mockFactory expect] andReturn:mockCell] cellForTableView:mockTableView
                                                     fromObject:mockObject];
    [[[mockFactory stub]
      andReturnValue:OCMOCK_VALUE(conforms)]
     conformsToProtocol:@protocol(ERNTableViewCellFactory)];

    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}
                                        defaultFactory:mockDefaultFactory];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:mockTableView
                                               fromObject:mockObject];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
    [mockFactory verify];
    [mockTableView verify];
    [mockObject verify];
    [mockCell verify];
}

-(void)testCellForTableViewFromObjectMappingsDefaultFactoryNonMatchingFactory
{
    //given
    id mockCell = [OCMockObject mockForClass:[UITableViewCell class]];
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    NSString *objectClassName = @"NonMatchingName";
    id mockFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    [[[mockDefaultFactory expect] andReturn:mockCell] cellForTableView:mockTableView
                                                            fromObject:mockObject];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}
                                        defaultFactory:mockDefaultFactory];

    //when
    UITableViewCell *cell = [cellFactory cellForTableView:mockTableView
                                               fromObject:mockObject];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
    [mockFactory verify];
    [mockTableView verify];
    [mockObject verify];
    [mockCell verify];
}

-(void)testHeightNilObjectNilMappingsNilDefaultFactory
{
    //given
    CGFloat defaultHeight = 34.0f;
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:nil];

    //when
    CGFloat height = [cellFactory cellHeightForObject:nil
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
}

-(void)testHeightNilObjectNilMappingsDefaultFactory
{
    //given
    CGFloat defaultHeight = 34.0f;
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:mockDefaultFactory];

    //when
    CGFloat height = [cellFactory cellHeightForObject:nil
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
    [mockDefaultFactory verify];
}

-(void)testHeightNilObjectMappingsDefaultFactory
{
    //given
    CGFloat defaultHeight = 34.0f;
    NSString *objectClassName = @"ClassName";
    id mockFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}
                                        defaultFactory:mockDefaultFactory];

    //when
    CGFloat height = [cellFactory cellHeightForObject:nil
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
    [mockDefaultFactory verify];
    [mockFactory verify];
}

-(void)testHeightObjectNilMappingsNilDefaultFactory
{
    //given
    CGFloat defaultHeight = 34.0f;
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:nil];

    //when
    CGFloat height = [cellFactory cellHeightForObject:mockObject
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
    [mockObject verify];
}

-(void)testHeightObjectNilMappingsDefaultFactory
{
    //given
    CGFloat defaultHeight = 34.0f;
    CGFloat expectedHeight = 24.0f;
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    [[[mockDefaultFactory expect] andReturnValue:OCMOCK_VALUE(expectedHeight)]
     cellHeightForObject:mockObject defaultHeight:defaultHeight];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil
                                        defaultFactory:mockDefaultFactory];

    //when
    CGFloat height = [cellFactory cellHeightForObject:mockObject
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockDefaultFactory verify];
    [mockObject verify];
}

-(void)testHeightObjectMappingsDefaultFactory
{
    //given
    BOOL conforms = YES;
    CGFloat defaultHeight = 34.0f;
    CGFloat expectedHeight = 42.0f;
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    NSString *objectClassName = NSStringFromClass([mockObject class]);
    id mockFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    [[[mockFactory stub]
      andReturnValue:OCMOCK_VALUE(conforms)]
     conformsToProtocol:@protocol(ERNTableViewCellFactory)];
    [[[mockFactory expect] andReturnValue:OCMOCK_VALUE(expectedHeight)]
     cellHeightForObject:mockObject
     defaultHeight:defaultHeight];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}
                                        defaultFactory:mockDefaultFactory];

    //when
    CGFloat height = [cellFactory cellHeightForObject:mockObject
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockDefaultFactory verify];
    [mockFactory verify];
    [mockObject verify];
}

-(void)testHeightObjectMappingsDefaultFactoryNonMatchingFactory
{
    //given
    CGFloat defaultHeight = 34.0f;
    CGFloat expectedHeight = 22.0f;
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    NSString *objectClassName = @"NonMatchingName";
    id mockFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    [[[mockDefaultFactory expect] andReturnValue:OCMOCK_VALUE(expectedHeight)]
     cellHeightForObject:mockObject
     defaultHeight:defaultHeight];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}
                                        defaultFactory:mockDefaultFactory];

    //when
    CGFloat height = [cellFactory cellHeightForObject:mockObject
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(expectedHeight));
    [mockDefaultFactory verify];
    [mockFactory verify];
    [mockObject verify];
}

@end
