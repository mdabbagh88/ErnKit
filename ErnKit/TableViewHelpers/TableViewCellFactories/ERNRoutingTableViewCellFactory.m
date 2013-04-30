#import "ERNRoutingTableViewCellFactory.h"
#import "ERNNullTableViewCellFactory.h"
#import "NSObject+ERNHelper.h"
#import "ERNDummyTableViewCell.h"

@interface ERNRoutingTableViewCellFactory ()
@property (nonatomic, readonly, copy) NSDictionary *mappings;
@property (nonatomic, readonly) id<ERNTableViewCellFactory> defaultFactory;
@end

@implementation ERNRoutingTableViewCellFactory

@synthesize mappings = _mappings;
@synthesize defaultFactory = _defaultFactory;

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    ERNCheckNilAndReturn(tableView, [ERNDummyTableViewCell dummyCell]);
    ERNCheckNilAndReturn(object, [ERNDummyTableViewCell dummyCell]);
    return [[self factoryForObject:object] cellForTableView:tableView
                                                 fromObject:object];
}

-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight
{
    ERNCheckNilAndReturn(object, defaultHeight);
    return [[self factoryForObject:object] cellHeightForObject:object
                                                 defaultHeight:defaultHeight];
}

-(id<ERNTableViewCellFactory>)factoryForObject:(id<NSObject>)object
{
    return [self validFactory:[self mappings][NSStringFromClass([object class])]];
}

-(id<ERNTableViewCellFactory>)validFactory:(id<ERNTableViewCellFactory>)factory;
{
    return [self factoryIsValid:factory] ? factory : [self defaultFactory];
}

-(BOOL)factoryIsValid:(id<ERNTableViewCellFactory>)factory
{
    return [factory conformsToProtocol:@protocol(ERNTableViewCellFactory)];
}

-(id<ERNTableViewCellFactory>)defaultFactory
{
    _defaultFactory = _defaultFactory ? _defaultFactory : [ERNNullTableViewCellFactory tableViewCellFactory];
    return _defaultFactory;
}

-(NSDictionary *)mappings
{
    _mappings = _mappings ? _mappings : @{};
    return _mappings;
}

-(id)initWithMappings:(NSDictionary *)mappings
       defaultFactory:(id<ERNTableViewCellFactory>)defaultFactory
{
    self = [self initWithMappings:mappings];
    ERNCheckNil(self);
    _defaultFactory = defaultFactory ? defaultFactory : _defaultFactory;
    return self;
}

-(id)initWithMappings:(NSDictionary *)mappings
{
    self = [self init];
    ERNCheckNil(self);
    _mappings = mappings;
    return self;
}

+(instancetype)tableViewCellFactory
{
    return [[self alloc] init];
}

+(instancetype)tableViewCellFactoryWithMappings:(NSDictionary *)mappings
{
    return [[self alloc] initWithMappings:mappings];
}

+(instancetype)tableViewCellFactoryWithMappings:(NSDictionary *)mappings
                                 defaultFactory:(id<ERNTableViewCellFactory>)defaultFactory
{
    return [[self alloc] initWithMappings:mappings
                           defaultFactory:defaultFactory];
}

@end
