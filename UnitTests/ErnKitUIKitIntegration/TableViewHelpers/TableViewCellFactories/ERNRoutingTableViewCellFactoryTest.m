#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNRoutingTableViewCellFactoryTest.h"
#import "ERNRoutingTableViewCellFactory.h"

@interface ERNMockTableViewCellFactory : NSObject <ERNTableViewCellFactory>
@end

@implementation ERNMockTableViewCellFactory

-(UITableViewCell *)cellWithCellReuser:(UITableViewCell *(^)(NSString *))block
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

-(void)testCellForNilTableViewFromNilObjectNilMappings
{
    //given
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil];

    //when
    UITableViewCell *cell = [cellFactory cellWithCellReuser:nil
                                                 fromObject:nil];

    //then
    assertThat(cell, notNilValue());
}

-(void)testCellForNilTableViewFromNilObjectMappings
{
    //given
    NSString *objectClassName = @"ClassName";
    id mockFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}];

    //when
    UITableViewCell *cell = [cellFactory cellWithCellReuser:nil
                                                 fromObject:nil];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
    [mockFactory verify];
}

-(void)testCellForTableViewFromNilObjectNilMappings
{
    //given
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil];

    //when
    UITableViewCell *cell = [cellFactory cellWithCellReuser:
                             ^UITableViewCell *(NSString *identifier) {
                                 return nil;
                             }
                                                 fromObject:nil];

    //then
    assertThat(cell, notNilValue());
}

-(void)testCellForTableViewFromNilObjectMappings
{
    //given
    NSString *objectClassName = @"ClassName";
    id mockFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}];

    //when
    UITableViewCell *cell = [cellFactory cellWithCellReuser:
                             ^UITableViewCell *(NSString *identifier) {
                                 return nil;
                             }
                                                 fromObject:nil];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
    [mockFactory verify];
}

-(void)testCellForNilTableViewFromObjectNilMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil];

    //when
    UITableViewCell *cell = [cellFactory cellWithCellReuser:nil
                                                 fromObject:mockObject];

    //then
    assertThat(cell, notNilValue());
    [mockObject verify];
}

-(void)testCellForNilTableViewFromObjectMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    NSString *objectClassName = NSStringFromClass([mockObject class]);
    id mockFactory = [OCMockObject niceMockForClass:[ERNMockTableViewCellFactory class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}];

    //when
    UITableViewCell *cell = [cellFactory cellWithCellReuser:nil
                                                 fromObject:mockObject];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
    [mockFactory verify];
    [mockObject verify];
}

-(void)testCellForTableViewFromObjectNilMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil];

    //when
    UITableViewCell *cell = [cellFactory cellWithCellReuser:
                             ^UITableViewCell *(NSString *identifier) {
                                 return nil;
                             }
                                                 fromObject:mockObject];

    //then
    assertThat(cell, notNilValue());
    [mockObject verify];
}

-(void)testCellForTableViewFromObjectMappings
{
    //given
    BOOL conforms = YES;
    UITableViewCell *(^mockBlock)(NSString *identifier) = ^UITableViewCell *(NSString *identifier) {
        return nil;
    };
    id mockCell = [OCMockObject mockForClass:[UITableViewCell class]];
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    NSString *objectClassName = NSStringFromClass([mockObject class]);
    id mockFactory = [OCMockObject niceMockForClass:[ERNMockTableViewCellFactory class]];
    [[[mockFactory expect] andReturn:mockCell] cellWithCellReuser:mockBlock
                                                       fromObject:mockObject];
    [[[mockFactory stub]
      andReturnValue:OCMOCK_VALUE(conforms)]
     conformsToProtocol:@protocol(ERNTableViewCellFactory)];

    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}];

    //when
    UITableViewCell *cell = [cellFactory cellWithCellReuser:mockBlock
                                                 fromObject:mockObject];

    //then
    assertThat(cell, notNilValue());
    [mockDefaultFactory verify];
    [mockFactory verify];
    [mockObject verify];
    [mockCell verify];
}

-(void)testHeightNilObjectNilMappings
{
    //given
    CGFloat defaultHeight = 34.0f;
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil];

    //when
    CGFloat height = [cellFactory cellHeightForObject:nil
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
}

-(void)testHeightNilObjectMappings
{
    //given
    CGFloat defaultHeight = 34.0f;
    NSString *objectClassName = @"ClassName";
    id mockFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id mockDefaultFactory = [OCMockObject mockForClass:[ERNMockTableViewCellFactory class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}];

    //when
    CGFloat height = [cellFactory cellHeightForObject:nil
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
    [mockDefaultFactory verify];
    [mockFactory verify];
}

-(void)testHeightObjectNilMappings
{
    //given
    CGFloat defaultHeight = 34.0f;
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id<ERNTableViewCellFactory> cellFactory =
    [ERNRoutingTableViewCellFactory createWithMappings:nil];

    //when
    CGFloat height = [cellFactory cellHeightForObject:mockObject
                                        defaultHeight:defaultHeight];

    //then
    assertThatFloat(height, equalToFloat(defaultHeight));
    [mockObject verify];
}

-(void)testHeightObjectMappings
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
    [ERNRoutingTableViewCellFactory createWithMappings:@{objectClassName : mockFactory}];

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
