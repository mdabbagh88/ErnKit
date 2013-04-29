#import "ERNRoutingUrlMimeFactory.h"
#import "ERNNullUrlMimeFactory.h"
#import "NSObject+ERNHelper.h"
#import "NSURL+ERNHelper.h"

@interface ERNRoutingUrlMimeFactory ()
@property (nonatomic, readonly, copy) NSDictionary *mappings;
@end

@implementation ERNRoutingUrlMimeFactory

@synthesize mappings = _mappings;

-(NSURL *)urlForObject:(id<NSObject>)object
{
    return [self validUrlForObject:[[self factoryForObject:object] urlForObject:object]];
}

-(NSURL *)validUrlForObject:(NSURL *)url
{
    return url ? url : [NSURL nullURL];
}

-(NSString *)mimeForObject:(id<NSObject>)object
{
    return [self validMimeForObject:[[self factoryForObject:object] mimeForObject:object]];
}

-(NSString *)validMimeForObject:(NSString *)mime
{
    return mime ? mime : @"";
}

-(id<ERNUrlMimeFactory>)factoryForObject:(id<NSObject>)object
{
    return [self validFactory:[self mappings][NSStringFromClass([object class])]];
}

-(id<ERNUrlMimeFactory>)validFactory:(id<ERNUrlMimeFactory>)factory
{
    return [self factoryIsValid:factory] ? factory : [ERNNullUrlMimeFactory factory];
}

-(BOOL)factoryIsValid:(id<ERNUrlMimeFactory>)factory
{
    return [factory conformsToProtocol:@protocol(ERNUrlMimeFactory)];
}

-(NSDictionary *)mappings
{
    _mappings = _mappings ? _mappings : @{};
    return _mappings;
}

-(id)initWithMappings:(NSDictionary *)mappings
{
    self = [self init];
    ERNCheckNil(self);
    _mappings = mappings;
    return self;
}

+(instancetype)urlMimeFactoryWithMappings:(NSDictionary *)mappings
{
    return [[self alloc] initWithMappings:mappings];
}

@end
