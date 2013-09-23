#import "ERNRefreshAsyncRepositoryAction.h"
#import "ERNNullAsyncRepository.h"
#import "ERNErrorHandler.h"

@interface ERNRefreshAsyncRepositoryAction ()
@property (nonatomic, readonly) id<ERNAsyncRepository> repository;
@end

@implementation ERNRefreshAsyncRepositoryAction {
    id<ERNAsyncRepository> _repository;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncRepository>)repository
{
    return [[self alloc] initWithRepository:repository];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)__unused resource
{
    [[self repository] refresh];
}

#pragma mark - private - accessors

ERNLazyLoadGetter(id<ERNAsyncRepository>, repository, [ERNNullAsyncRepository create])

#pragma mark - private - initializers

-(id)initWithRepository:(id<ERNAsyncRepository>)repository
{
    self = [super init];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

@end
