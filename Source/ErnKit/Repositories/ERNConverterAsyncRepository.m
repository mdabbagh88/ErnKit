#import "ERNConverterAsyncRepository.h"
#import "ERNNullAsyncRepository.h"
#import "ERNErrorHandler.h"

@interface ERNConverterAsyncRepository ()
@property (nonatomic, readonly) id<ERNAsyncRepository> repository;
@end

@implementation ERNConverterAsyncRepository {
    id<ERNAsyncRepository> _repository;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncRepository>)repository
{
    return [[self alloc] initWithRepository:repository];
}

#pragma mark - public - initializers

-(id)initWithRepository:(id<ERNAsyncRepository>)repository
{
    self = [super init];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

#pragma mark - ERNObservable

-(void)addObserver:(id)observer
          selector:(SEL)selector
{
    ERNCheckNilNoReturn(observer);
    ERNCheckNilNoReturn(selector);
    [[self repository] addObserver:observer
                          selector:selector];
}

-(void)removeObserver:(id)observer
{
    ERNCheckNilNoReturn(observer);
    [[self repository] removeObserver:observer];
}

-(void)refresh
{
    [[self repository] refresh];
}

#pragma mark - private - accessors

ERNLazyLoadGetter(id<ERNAsyncRepository>, repository, [ERNNullAsyncRepository create])

@end
