#import "ERNObjectAsyncItemRepository.h"
#import "ERNErrorHandler.h"

@implementation ERNObjectAsyncItemRepository {
    id<NSObject> _item;
}

#pragma mark - public - constructors

+(instancetype)repositoryWithItem:(id<NSObject>)item
{
    return [[self alloc] initWithItem:item];
}

#pragma mark - public - accessors

-(id<NSObject>)item
{
    _item = _item ? _item : [NSNull null];
    return _item;
}

#pragma mark - private - initializers

-(id)initWithItem:(id<NSObject>)item
{
    self = [self init];
    ERNCheckNil(self);
    _item = item;
    return self;
}

@end
