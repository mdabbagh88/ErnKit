#import "ERNResource.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

static ERNResource *immutableSingletonNull;

@implementation ERNResource {
    NSURL *_url;
    NSString *_mime;
    id<NSObject> _object;
}

#pragma mark - public - constructors

+(instancetype)createWithUrl:(NSURL *)url
                        mime:(NSString *)mime
{
    return [[self alloc] initWithUrl:url
                                mime:mime
                              object:nil];
}

+(instancetype)createWithUrl:(NSURL *)url
                        mime:(NSString *)mime
                      object:(id<NSObject>)object
{
    return [[self alloc] initWithUrl:url
                                mime:mime
                              object:object];
}

+(instancetype)createNull
{
    return immutableSingletonNull;
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingletonNull = [self createWithUrl:[NSURL ERN_createNull]
                                            mime:@""];
}

#pragma mark - private - accessors

-(NSURL *)url
{
    return _url = _url ? _url : [NSURL ERN_createNull];
}

-(NSString *)mime
{
    return _mime = _mime ? _mime : @"";
}

#pragma mark - private - initializers

-(id)initWithUrl:(NSURL *)url
            mime:(NSString *)mime
          object:(id<NSObject>)object
{
    self = [super init];
    _url = url;
    _mime = mime;
    _object = object;
    return self;
}

@end
