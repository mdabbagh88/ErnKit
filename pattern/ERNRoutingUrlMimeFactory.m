#import "ERNRoutingUrlMimeFactory.h"

@interface ERNRoutingUrlMimeFactory ()
@property (nonatomic, readonly, copy) NSDictionary *mappings;
@end

@implementation ERNRoutingUrlMimeFactory

-(NSURL *)urlForObject:(id<NSObject>)object
{
    NSURL *url = [[self factoryForObject:object] urlForObject:object];
    return (url != nil) ? url : [NSURL URLWithString:@""];
}

-(NSString *)mimeForObject:(id<NSObject>)object
{
    NSString *mime = [[self factoryForObject:object] mimeForObject:object];
    return (mime != nil) ? mime : @"";
}

-(id<ERNUrlMimeFactory>)factoryForObject:(id<NSObject>)object
{
    id<ERNUrlMimeFactory>urlMimeFactory = nil;
    id<NSObject> factoryObject = [self mappings][NSStringFromClass([object class])];
    if ([factoryObject conformsToProtocol:@protocol(ERNUrlMimeFactory)]) {
        urlMimeFactory = (id<ERNUrlMimeFactory>)factoryObject;
    }
    return urlMimeFactory;
}

-(id)initWithMappings:(NSDictionary *)mappings
{
    self = [super init];
    _mappings = (mappings != nil) ? mappings : @{};
    return self;
}

+(instancetype)urlMimeFactoryWithMappings:(NSDictionary *)mappings
{
    return [[self alloc] initWithMappings:mappings];
}

@end
