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
          validUrl([resource url]),
          validMime([resource mime]));
}

#pragma mark - private

static NSURL *validUrl(NSURL *url)
{
    return url ? url : [NSURL ERN_createNull];
}

static NSString *validMime(NSString *mime)
{
    return mime ? mime : @"";
}

#pragma mark - private - accessors

ERNLazyLoadGetter(NSString *, string, @"ERNLogAction")

#pragma mark - private - initializers

-(id)initWithLogString:(NSString *)string
{
    self = [super init];
    ERNCheckNil(self);
    _string = string;
    return self;
}

@end
