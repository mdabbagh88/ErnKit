#import "ERNConverterAsyncRepository.h"
#import "ERNErrorHandler.h"

@interface ERNConverterAsyncRepository ()
@property (nonatomic, readonly) id<ERNAsyncRepository>repository;
@end

@implementation ERNConverterAsyncRepository {
}

#pragma mark - public - initializers

-(id)initWithRepository:(id<ERNAsyncRepository>)repository
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

#pragma mark - ERNAsyncRepository

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

@end
