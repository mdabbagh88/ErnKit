#import "ERNRefreshAsyncRepositoryAction.h"
#import "ERNErrorHandler.h"

@interface ERNRefreshAsyncRepositoryAction ()
@property (nonatomic, readonly) id<ERNAsyncRepository> repository;
@end

@implementation ERNRefreshAsyncRepositoryAction {
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncRepository>)repository
{
    return [[self alloc] initWithRepository:repository];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    [[self repository] refresh];
}

#pragma mark - private - initializers

-(id)initWithRepository:(id<ERNAsyncRepository>)repository
{
    self = [super init];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

@end
