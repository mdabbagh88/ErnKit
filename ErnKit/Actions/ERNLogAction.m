#import "ERNLogAction.h"
#import "ERNErrorHandler.h"

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
    NSLog(@"%@ : %@ : %@", [self string], url, mime);
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
