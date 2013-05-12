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

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    NSLog(@"%@ : %@ : %@", [self string], [self validUrl:url], [self validMime:mime]);
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
    self = [self init];
    ERNCheckNil(self);
    _string = string;
    return self;
}

@end
