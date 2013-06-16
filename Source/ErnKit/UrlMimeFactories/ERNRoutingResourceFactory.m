#import "ERNRoutingResourceFactory.h"
#import "ERNNullResourceFactory.h"
#import "ERNResource.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

@interface ERNRoutingResourceFactory ()
@property (nonatomic, readonly) NSDictionary *mappings;
@end

@implementation ERNRoutingResourceFactory {
    NSDictionary *_mappings;
}

#pragma mark - public - constructors

+(instancetype)createWithMappings:(NSDictionary *)mappings
{
    return [[self alloc] initWithMappings:mappings];
}

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(id<NSObject>)object
{
    ERNCheckNilAndReturn(object, [ERNResource createNull]);
    return [self validResource:[[self factoryForObject:object] resourceForObject:object]];
}

#pragma mark - private

-(ERNResource *)validResource:(ERNResource *)resource
{
    return resource ? resource : [ERNResource createNull];
}

-(id<ERNResourceFactory>)factoryForObject:(id<NSObject>)object
{
    return [self validFactory:[self mappings][NSStringFromClass([object class])]];
}

-(id<ERNResourceFactory>)validFactory:(id<ERNResourceFactory>)factory
{
    return [self factoryIsValid:factory] ? factory : [ERNNullResourceFactory create];
}

-(BOOL)factoryIsValid:(id<ERNResourceFactory>)factory
{
    return [factory conformsToProtocol:@protocol(ERNResourceFactory)];
}

#pragma mark - private - accessors

-(NSDictionary *)mappings
{
    return _mappings = _mappings ? _mappings : @{};
}

#pragma mark - private - initializers

-(id)initWithMappings:(NSDictionary *)mappings
{
    self = [self init];
    ERNCheckNil(self);
    _mappings = mappings;
    return self;
}

@end
