#import "ERNRoutingTableViewCellFactory.h"
#import "ERNNullTableViewCellFactory.h"

@interface ERNRoutingTableViewCellFactory ()
@property (nonatomic, readonly, copy) NSDictionary *mappings;
@property (nonatomic, readonly) id<ERNTableViewCellFactory> defaultFactory;
@end

@implementation ERNRoutingTableViewCellFactory

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    NSString *classString = NSStringFromClass([object class]);
    id<ERNTableViewCellFactory> factory = [self mappings][classString];

    if (factory == nil) {
        factory = [self defaultFactory];
    }
    return [factory cellForTableView:tableView
                          fromObject:object];
}

-(id)initWithMappings:(NSDictionary *)mappings
       defaultFactory:(id<ERNTableViewCellFactory>)defaultFactory
{
    self = [super init];
    _mappings = (mappings != nil) ? mappings : @{};
    _defaultFactory = (defaultFactory != nil) ? defaultFactory : [ERNNullTableViewCellFactory tableViewCellFactory];
    return self;
}

-(id)initWithMappings:(NSDictionary *)mappings
{
    return [self initWithMappings:mappings
                   defaultFactory:[ERNNullTableViewCellFactory tableViewCellFactory]];
}

-(id)init
{
    return [self initWithMappings:@{}];
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
