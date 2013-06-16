#import "ERNRoutingUrlMimeFactory.h"
#import "ERNNullUrlMimeFactory.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

@interface ERNRoutingUrlMimeFactory ()
@property (nonatomic, readonly) NSDictionary *mappings;
@end

@implementation ERNRoutingUrlMimeFactory {
    NSDictionary *_mappings;
}

#pragma mark - public - constructors

+(instancetype)createWithMappings:(NSDictionary *)mappings
{
    return [[self alloc] initWithMappings:mappings];
}

#pragma mark - ERNUrlMimeFactory

-(NSURL *)urlForObject:(id<NSObject>)object
{
    ERNCheckNilAndReturn(object, [NSURL ERN_createNull]);
    return [self validUrlForObject:[[self factoryForObject:object] urlForObject:object]];
}

-(NSString *)mimeForObject:(id<NSObject>)object
{
    ERNCheckNilAndReturn(object, @"");
    return [self validMimeForObject:[[self factoryForObject:object] mimeForObject:object]];
}

#pragma mark - private

-(NSURL *)validUrlForObject:(NSURL *)url
{
    return url ? url : [NSURL ERN_createNull];
}

-(NSString *)validMimeForObject:(NSString *)mime
{
    return mime ? mime : @"";
}

-(id<ERNResourceFactory>)factoryForObject:(id<NSObject>)object
{
    return [self validFactory:[self mappings][NSStringFromClass([object class])]];
}

-(id<ERNResourceFactory>)validFactory:(id<ERNResourceFactory>)factory
{
    return [self factoryIsValid:factory] ? factory : [ERNNullUrlMimeFactory create];
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
