#import "ERNObjectAsyncItemRepository.h"
#import "ERNErrorHandler.h"

@implementation ERNObjectAsyncItemRepository {
    id<NSObject> _item;
}

#pragma mark - public - constructors

+(instancetype)createWithItem:(id<NSObject>)item
{
    return [[self alloc] initWithItem:item];
}

#pragma mark - public - accessors

ERNLazyLoadGetter(id<NSObject>, item, [NSNull null])

#pragma mark - private - initializers

-(id)initWithItem:(id<NSObject>)item
{
    self = [super init];
    ERNCheckNil(self);
    _item = item;
    return self;
}

@end
