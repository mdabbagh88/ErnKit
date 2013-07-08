#import "ERNLogAction.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

@interface ERNLogAction ()
@property (nonatomic, readonly, copy) NSString *string;
@end

@implementation ERNLogAction {
    NSString *_string;
}

#pragma mark - public - constructors

+(instancetype)createWithLogString:(NSString *)string
{
    return [[self alloc] initWithLogString:string];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    NSLog(@"%@ : %@ : %@",
          [self string],
          [self validUrl:[resource url]],
          [self validMime:[resource mime]]);
}

#pragma mark - private

-(NSURL *)validUrl:(NSURL *)url
{
    return url ? url : [NSURL ERN_createNull];
}

-(NSString *)validMime:(NSString *)mime
{
    return mime ? mime : @"";
}

#pragma mark - private - accessors

-(NSString *)string
{
    return _string = _string ? _string : @"ERNLogAction";
}

#pragma mark - private - initializers

-(id)initWithLogString:(NSString *)string
{
    self = [super init];
    ERNCheckNil(self);
    _string = string;
    return self;
}

@end
