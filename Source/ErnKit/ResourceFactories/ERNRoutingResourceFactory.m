#import "ERNRoutingResourceFactory.h"
#import "ERNNullResourceFactory.h"
#import "ERNNullResource.h"
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
    ERNCheckNilAndReturn(object, [ERNNullResource create]);
    return validResource([[self factoryForObject:object] resourceForObject:object]);
}

#pragma mark - private

static ERNResource *validResource(ERNResource *resource)
{
    return resource ? resource : [ERNNullResource create];
}

-(id<ERNResourceFactory>)factoryForObject:(id<NSObject>)object
{
    return validFactory([self mappings][NSStringFromClass([object class])]);
}

static id<ERNResourceFactory> validFactory(id<ERNResourceFactory> factory)
{
    return factoryIsValid(factory) ? factory : [ERNNullResourceFactory create];
}

static BOOL factoryIsValid(id<ERNResourceFactory> factory)
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
    self = [super init];
    ERNCheckNil(self);
    _mappings = mappings;
    return self;
}

@end
