#import "ERNBlockAction.h"
#import "ERNErrorHandler.h"

@interface ERNBlockAction ()
@property (nonatomic, readonly, copy) ERNActionBlock block;
@end

@implementation ERNBlockAction {
    ERNActionBlock _block;
}

#pragma mark - public - constructors

+(instancetype)createWithBlock:(ERNActionBlock)block
{
    return [[self alloc] initWithBlock:block];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    ERNCheckNilNoReturn(resource);
    [self block](resource);
}

#pragma mark - private - accessors

-(ERNActionBlock)block
{
    return _block  = _block ? _block : ^(ERNResource *__unused resource){};
}

#pragma mark - private - initializers

-(id)initWithBlock:(ERNActionBlock)block
{
    self = [super init];
    ERNCheckNil(self);
    _block = block;
    return self;
}

@end
