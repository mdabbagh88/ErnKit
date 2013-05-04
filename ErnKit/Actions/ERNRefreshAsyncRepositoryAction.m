#import "ERNRefreshAsyncRepositoryAction.h"
#import "ERNErrorHandler.h"

@interface ERNRefreshAsyncRepositoryAction ()
@property (nonatomic, readonly) id<ERNAsyncRepository> repository;
@end

@implementation ERNRefreshAsyncRepositoryAction {
}

#pragma mark - public - constructors

+(instancetype)actionWithRepository:(id<ERNAsyncRepository>)repository
{
    return [[self alloc] initWithRepository:repository];
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    [[self repository] refresh];
}

#pragma mark - private - initializers

-(id)initWithRepository:(id<ERNAsyncRepository>)repository
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

@end
