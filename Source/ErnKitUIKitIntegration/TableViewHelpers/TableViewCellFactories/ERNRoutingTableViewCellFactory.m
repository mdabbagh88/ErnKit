#import "ERNRoutingTableViewCellFactory.h"
#import "ERNDefaultTableViewCellFactory.h"
#import "ERNErrorHandler.h"
#import "ERNNullTableViewCell.h"

@interface ERNRoutingTableViewCellFactory ()
@property (nonatomic, readonly, copy) NSDictionary *mappings;
@property (nonatomic, readonly) id<ERNTableViewCellFactory> defaultFactory;
@end

@implementation ERNRoutingTableViewCellFactory {
    NSDictionary *_mappings;
    id<ERNTableViewCellFactory> _defaultFactory;
}

#pragma mark - public - constructors

+(instancetype)createWithMappings:(NSDictionary *)mappings
{
    return [[self alloc] initWithMappings:mappings
                           defaultFactory:nil];
}

+(instancetype)createWithMappings:(NSDictionary *)mappings
                   defaultFactory:(id<ERNTableViewCellFactory>)defaultFactory
{
    return [[self alloc] initWithMappings:mappings
                           defaultFactory:defaultFactory];
}

#pragma mark - ERNTableViewCellFactory

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    ERNCheckNilAndReturn(tableView, [ERNNullTableViewCell create]);
    ERNCheckNilAndReturn(object, [ERNNullTableViewCell create]);
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

#pragma mark - private

-(id<ERNTableViewCellFactory>)factoryForObject:(id<NSObject>)object
{
    return [self validFactory:[self mappings][NSStringFromClass([object class])]];
}

-(id<ERNTableViewCellFactory>)validFactory:(id<ERNTableViewCellFactory>)factory;
{
    return [self factoryIsValid:factory] ? factory : [self defaultFactory];
}

-(BOOL)factoryIsValid:(id)factory
{
    return [factory conformsToProtocol:@protocol(ERNTableViewCellFactory)];
}

#pragma mark - private - accessors

-(id<ERNTableViewCellFactory>)defaultFactory
{
    return _defaultFactory = _defaultFactory ?
    _defaultFactory :
    [ERNDefaultTableViewCellFactory create];
}

-(NSDictionary *)mappings
{
    return _mappings = _mappings ? _mappings : @{};
}

#pragma mark - private - initializers

-(id)initWithMappings:(NSDictionary *)mappings
       defaultFactory:(id<ERNTableViewCellFactory>)defaultFactory
{
    self = [self init];
    ERNCheckNil(self);
    _mappings = mappings;
    _defaultFactory = defaultFactory;
    return self;
}

@end
