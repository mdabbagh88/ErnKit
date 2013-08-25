#import "ERNActionObjectAction.h"
#import "ERNResourceFactory.h"
#import "ERNNullResourceFactory.h"
#import "ERNAction.h"
#import "ERNErrorHandler.h"
#import "ERNRepositoryStore.h"

@interface ERNActionObjectAction ()
@property (nonatomic, readonly) id<ERNAction> action;
@property (nonatomic, readonly) id<ERNResourceFactory> resourceFactory;
@end

@implementation ERNActionObjectAction {
    id<ERNResourceFactory> _resourceFactory;
}

#pragma mark - public - constructors

+(instancetype)createWithAction:(id<ERNAction>)action
                resourceFactory:(id<ERNResourceFactory>)resourceFactory
{
    return [[self alloc] initWithAction:action
                        resourceFactory:resourceFactory];
}

#pragma mark - ERNObjectAction

-(void)actionForObject:(id<NSObject>)object
{
    ERNCheckNilNoReturn(object);
    ERNCheckNilNoReturn([self action]);
    [[self action] actionForResource:[self resourceForObject:object]];
}

#pragma mark - private

-(ERNResource *)resourceForObject:(id<NSObject>)object
{
    return [[self resourceFactory] resourceForObject:object];
}

#pragma mark - private - accessors

-(id<ERNResourceFactory>)resourceFactory
{
    return _resourceFactory = _resourceFactory ? _resourceFactory : [ERNNullResourceFactory create];
}

#pragma mark - private - initializers

-(id)initWithAction:(id<ERNAction>)action
    resourceFactory:(id<ERNResourceFactory>)resourceFactory
{
    self = [super init];
    ERNCheckNil(self);
    _action = action;
    _resourceFactory = resourceFactory;
    return self;
}

@end
